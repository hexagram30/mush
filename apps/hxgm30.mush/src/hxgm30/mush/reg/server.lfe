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
  (('accept (= (match-reg-state socket listen-sock session-id id) st))
   (log-debug "Matched accept message.")
   (log-debug "Got listen socket: ~p" `(,listen-sock))
   (log-debug "Got state: ~p" `(,st))
   (log-debug "Waiting for connection ...")
   (let ((`#(ok ,accept-sock) (gen_tcp:accept listen-sock)))
     (log-debug "Got connection on accept socket: ~p" `(,accept-sock))
     (hxgm30.mush.reg.sup:start-socket)
     (log-debug "Sending banner and prompt ...")
     (hxgm30.util:tcp-send accept-sock
                           (hxgm30.mush.reg.shell:welcome id))
     (log-debug "Setting new socket in server state ...")
     `#(noreply ,(set-reg-state-socket st accept-sock))))
  (('dispatch st)
   (hxgm30.mush.reg.shell:command-dispatch (self) st)
   `#(noreply ,(set-reg-state-command st '())))
  ((`#(confirm ,conf-code) st)
   (log-debug "Got confirmation code ~p" `(,conf-code))
   ;; XXX Make call to postgres to get saved conf code for session id
   ;; XXX Compare to passed conf code
   ;; XXX Make call to postgres to set confirmed to TRUE is equal
   `#(noreply ,st))
  ((`#(register ,email) (= (match-reg-state session-id id) st))
   (log-debug "Got registration email ~p" `(,email))
   (hxgm30.store.query:set-user-email id email)
   (hxgm30.mush.reg.shell:send-confirmation-code email)
   `#(noreply ,(set-reg-state-email st email)))
  ((`#(session-id ,id) st)
   `#(noreply ,(set-reg-state-session-id st id)))
  ((`#(ssh-key ,key) (= (match-reg-state session-id id) st))
   (let ((result (hxgm30.store.query:set-user-ssh-key id key)))
     (log-debug "Result: ~p" `(,result)))
   `#(noreply ,(set-reg-state-ssh-key st key)))
  (('quit (= (match-reg-state socket sock) st))
   (gen_tcp:close sock)
   `#(stop normal ,st))
  ((msg st)
   (log-debug "Got cast msg: ~p" `(,msg))
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

;;; -----------------
;;; private functions
;;; -----------------

(defun genserver-opts () '())
(defun unknown-command () #(error "Unknown command."))
