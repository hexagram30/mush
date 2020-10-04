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
   (log-debug "Dispatching with state: ~p" `(,st))
   (hxgm30.mush.reg.shell:command-dispatch (self) st)
   (log-debug "Dispatched to shell.")
   `#(noreply ,(post-dispatch-cleanup st)))
  ;; Process a user's confirmation code submission
  ((`#(confirm ,conf-code) st)
   `#(noreply ,(verify-email st conf-code)))
  ;; Register a user's email address
  ((`#(register ,email) st)
   `#(noreply ,(register-email st email)))
  ;; Swith the user's session ID to a previous one
  ((`#(resume ,id) st)
   `#(noreply ,(resume-session st id)))
  ;; Register a user's SSH key
  ((`#(ssh-key ,key) st)
   `#(noreply ,(register-ssh-key st key)))
  ;; Resend the email confirmation number
  (('resend-confirmation st)
   `#(noreply ,(resend-confirmation st)))
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
  "Entry point for the email registration workflow.

  This is used for performing checks before the actual registration occurs
  (prevents overly-nested code and easier testing)."
  (((= (match-reg-state session-id id) st) email)
   (log-debug "Got registration email ~p" `(,email))
   (case (hxgm30.store.query:set-user-email id email)
     (`#(error ,msg)
      (log-error msg)
      (append-errors st (list #"ERROR: " msg)))
     ('()
      (register-email st id email)
      (let ((new-st (append-messages
                     st "Check your email for a confirmation code.")))
        (update-status (set-reg-state-email new-st email))))
     (result
      (log-warning "Unexpected result: ~p" `(,result))
      st))))

(defun register-email (st id email)
  "The bit that does the actual work of registering emails."
  (let* ((code (hxgm30.util:confirmation-code email))
         (new-st (set-reg-state-email st email))
         ;; XXX check new update-status function -- is this working?
         (status (update-status new-st)))
    ;; XXX check new set-user-conf-code function
    (hxgm30.store.query:set-user-conf-code id code)
    (send-confirmation-code email code)
    (set-reg-state-status new-st status)))

(defun register-ssh-key
  (((= (match-reg-state session-id id) st) key)
   (log-debug "Got SSH public key ~p" `(,key))
   (case (hxgm30.store.query:set-user-ssh-key id key)
     (`#(error ,msg)
      (log-error msg)
      (append-errors st (list #"ERROR: " msg)))
     ('()
      (clj:-> st
              (set-reg-state-ssh-key key)
              (update-status)))
     (result
      (log-warning "Unexpected result: ~p" `(,result))
      st))))

(defun resend-confirmation
  (((= (match-reg-state session-id id email email) st))
   (log-debug "Resending confirmation code to ~p" `(,email))
   (let ((code (hxgm30.store.query:user-conf-code id)))
     (send-confirmation-code email code)
     st)))

(defun resume-session (st id)
  (let ((user-data (hxgm30.store.query:user id)))
    (case (hxgm30.store.query:user id)
      ('() (set-reg-state-session-id st id))
      (`#m(#"email" ,email
           #"ssh_public_key" ,key
           #"registration_status" ,status
           #"confirmed" ,confirmed)
          (log-debug "Saved email: ~p" `(,email))
          (log-debug "Saved SSH public key: ~p" `(,key))
          (log-debug "Saved confirmed: ~p" `(,confirmed))
          (log-debug "Saved registration status: ~p" `(,status))
          (clj:-> st
                  (set-reg-state-session-id id)
                  (set-reg-state-email email)
                  (set-reg-state-ssh-key key)
                  (set-reg-state-confirmed confirmed)
                  (set-reg-state-status status))))))

(defun verify-email
  (((= (match-reg-state session-id id) st) conf-code)
   (log-debug "Got confirmation code ~p" `(,conf-code))
   (let* ((stored-conf-code (hxgm30.store.query:user-conf-code id))
          (match? (== (list_to_binary conf-code) stored-conf-code)))
     (log-debug "Matching? ~p" `(,match?))
     (cond
      ((not match?)
       (update-status (append-errors st (non-matching-code-msg))))
      (match?
       (hxgm30.store.query:set-user-confirmed id)
       (update-status st))))))

;;; -----------------
;;; private functions
;;; -----------------

(defun genserver-opts () '())
(defun unknown-msg () #"ERROR: Unknown command.")
(defun non-matching-code-msg ()
  #"ERROR: Provided confirmation code does not match code on record.")

(defun unknown-command ()
  `#(error ,(unknown-msg)))

(defun append-errors(st msg)
  (set-reg-state-errors
   st
   (lists:append (reg-state-errors st) `(,msg))))

(defun append-messages (st msg)
  (set-reg-state-messages
   st
   (lists:append (reg-state-messages st) `(,msg))))

(defun post-dispatch-cleanup (st)
  (clj:-> st
          (set-reg-state-command '())
          (set-reg-state-errors '())
          (set-reg-state-messages '())))

(defun update-status
  "Note that the source of truth for valid return values are defined in the
  PostgreSQL 'reg_state' ENUM defined in our DB schema. Currently these are
  * initiated - just an email has been provided
  * incomplete - email + one of the other required fields, but not all
  * complete - all required service_user data have been saved"
  (((= (match-reg-state email em ssh-key key status stts session-id id) st))
   (let* ((db-confirmed? (hxgm30.store.query:user-confirmed? id))
          (confirmed? (if (or (== db-confirmed? 'undefined)
                              (== db-confirmed? 'null))
                        'false
                        db-confirmed?))
          (email? (if (or (== em 'undefined)
                          (== em 'null))
                    'false
                    'true))
          (ssh-key? (if (or (== key 'undefined)
                            (== key 'null))
                      'false
                      'true))
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

(defun send-confirmation-code
  ((to conf-code) (when (is_binary to))
   (send-confirmation-code (binary_to_list to) conf-code))
  ((to conf-code)
   (let ((msg (io_lib:format (hxgm30.util:read-priv-file
                              (hxgm30.mush.config:reg-email-tmpl))
                             `(,conf-code))))
     (case (sendmail:send `#m(to ,to
                                 from ,(hxgm30.mush.config:reg-email-from)
                                 subject ,(hxgm30.mush.config:reg-email-subj)
                                 message ,msg))
       (`#(0 ,_)
        (log-info "Successfully sent registration email to ~s" `(,to)))
       (`#(,exit-code ,err)
        (log-error "Could not send registration email: ~p" `(,err)))))))
