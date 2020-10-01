(defmodule hxgm30.mush.reg.server
  (behaviour gen_server)
  ;; gen_server implementation
  (export
   (start_link 1))
  ;; callback implementation
  (export
   (init 1)
   (handle_call 3)
   (handle_cast 2)
   (handle_info 2)
   (terminate 2)
   (code_change 3))
  ;; additional
  (export
   (stop 0)))

(include-lib "logjam/include/logjam.hrl")
(include-lib "hxgm30.mush/include/registration.lfe")

;;; -------------------------
;;; gen_server implementation
;;; -------------------------

(defun start_link (sock)
  (log-debug "Starting TCP server ...")
  (gen_server:start_link (MODULE)
                         sock
                         (genserver-opts)))

;;; -----------------------
;;; callback implementation
;;; -----------------------

(defun init (sock)
  (gen_server:cast (self) 'accept)
  `#(ok ,(make-reg-state socket sock
                     session-id (hxgm30.util:uuid4 #m(return string)))))

(defun handle_info
  ((`#(EXIT ,_from normal) st)
   (log-debug "Normal exit ...")
   `#(noreply ,st))
  ((`#(EXIT ,pid ,reason) st)
   (log-error "Process ~p exited! (Reason: ~p)~n" `(,pid ,reason))
   `#(noreply ,st))
  (('timeout st)
   (log-debug "Handling TCP timeout info message ...")
   `#(noreply ,st))
  ((`#(tcp ,sock ,data) st)
   (log-debug "Handling TCP info message ...")
   (let ((parsed (hxgm30.mush.shell:tokenize (string:trim data))))
     (log-debug "Parsed input: ~p" `(,parsed))
     (gen_server:cast (self) 'dispatch)
     `#(noreply ,(set-reg-state-command st parsed))))
  ((`#(tcp_closed ,sock) st)
   (log-debug "Handling TCP closed info message ...")
   `#(stop normal ,st))
  ((`#(tcp_error ,sock) st)
   (log-debug "Handling TCP error info message ...")
   `#(stop normal ,st))
  ((msg st)
   (log-debug "Got unexpected message: ~p" `(,msg))
   `#(noreply ,st)))

(defun handle_cast
  ;; Start a new session
  (('accept st)
   `#(noreply ,(accept-connection st)))
  ;; Process a user command
  (('dispatch st)
   (hxgm30.mush.reg.shell:command-dispatch (self) st)
   `#(noreply ,(set-reg-state-command st '())))
  ;; Process a user's confirmation code submission
  ((`#(confirm ,conf-code) st)
   `#(noreply ,(verify-email st conf-code)))
  ;; Register a user's email address
  ((`#(register ,email) st)
     `#(noreply ,(register-email st email)))
  ;; Swith the user's session ID to a previous one
  ((`#(session-id ,id) st)
   `#(noreply ,(switch-session st id)))
  ;; Register a user's SSH key
  ((`#(ssh-key ,key) st)
   `#(noreply ,(register-ssh-key st key)))
  ;; Disconnect from the registration service
  (('quit (= (match-reg-state socket sock) st))
   (gen_tcp:close sock)
   `#(stop normal ,st))
  ((msg st)
   (log-debug "Got unexpected cast msg: ~p" `(,msg))
   `#(noreply ,st)))

(defun handle_call
  ((msg _from st)
   (log-debug "Got call msg: ~p" `(,msg))
   `#(reply ,(unknown-command) ,st)))

(defun terminate (_reason _st)
  (log-notice "Terminating ...")
  'ok)

(defun code_change (_old-version st _extra)
  (log-notice "Code change ...")
  `#(ok ,st))

;;; --------------------
;;; additional functions
;;; --------------------

(defun stop ()
  'ok)

;;; --------------------------------
;;; private handler helper functions
;;; --------------------------------

(defun accept-connection
  (((= (match-reg-state socket listen-sock session-id id) st))
   (log-debug "Waiting for connection ...")
   (let ((`#(ok ,accept-sock) (gen_tcp:accept listen-sock)))
     (log-debug "Got connection on accept socket: ~p" `(,accept-sock))
     (hxgm30.mush.reg.sup:start-socket)
     (hxgm30.util:tcp-send accept-sock
                           (hxgm30.mush.reg.shell:welcome id))
     (log-debug "Setting new socket in server state ...")
     (hxgm30.store.query:create-user id)
     (set-reg-state-socket st accept-sock))))

(defun register-email
  (((= (match-reg-state session-id id) st) email)
   (log-debug "Got registration email ~p" `(,email))
   ;; XXX do basic regex check on email!
   (hxgm30.store.query:set-user-email id email)
   (let* ((code (hxgm30.util:confirmation-code email))
          (new-st (set-reg-state-email st email))
          ;; XXX check new update-status function
          (status (update-status new-st)))
     ;; XXX check new set-user-conf-code function
     (hxgm30.store.query:set-user-conf-code id code)
     (hxgm30.mush.reg.shell:send-confirmation-code email code)
     (set-reg-state-status new-st status))))

(defun register-ssh-key
  (((= (match-reg-state session-id id) st) key)
   (let* ((result (hxgm30.store.query:set-user-ssh-key id key))
          (new-st (set-reg-state-ssh-key st key))
          ;; XXX check new update-status function
          (status (update-status new-st)))
     (set-reg-state-status new-st status))))

(defun switch-session (st id)
  (let ((user-data (hxgm30.store.query:user id)))
    ;; XXX if not found, just replace id
    ;; XXX if found, create new state object with all new data
    (set-reg-state-session-id st id)))

(defun verify-email
  (((= (match-reg-state session-id id) st) conf-code)
   (log-debug "Got confirmation code ~p" `(,conf-code))
   (let* ((stored-conf-code (hxgm30.store.query:user-conf-code id))
          (match? (=/= conf-code stored-conf-code)))
     (if match?
       (hxgm30.store.query:set-user-confirmed id))
     (update-status st))))

;;; -----------------
;;; private functions
;;; -----------------

(defun genserver-opts () '())
(defun unknown-command () #(error "Unknown command."))

(defun update-status
  "Note that the source of truth for valid return values are defined in the
  PostgreSQL 'reg_state' ENUM defined in our DB schema. Currently these are
  * initiated - just an email has been provided
  * incomplete - email + one of the other required fields, but not all
  * complete - all required service_user data have been saved"
  (((= (match-reg-state email em ssh-key key status stts session-id id) st))
   (let* ((confirmed? (hxgm30.store.query:user-confirmed? id))
          (email? (if (== em 'undefined 'false) 'true))
          (ssh-key? (if (== key 'undefined 'false) 'true))
          (new-stts (cond
                     ((and confirmed? email? ssh-key?) "complete")
                     ((and (or (and confirmed? email?)
                               (and confirmed? ssh-key?)
                               (and email? ssh-key?))) "incomplete")
                     (email? "initiated")
                     ('true 'undefined)))
          (changed? (=/= new-stts stts)))
     (if (and changed? (=/= new-stts 'undefined))
       (hxgm30.store.query:set-user-reg-status id new-stts))
     (set-reg-state-status st new-stts))))