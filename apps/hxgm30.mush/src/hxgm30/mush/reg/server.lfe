;;;; Notes on implementing TCP servers:
;;;; * https://github.com/ogolosovskiy/non_blocking_tcp_server
;;;; * http://20bits.com/article/erlang-a-generalized-tcp-server
;;;; * https://learnyousomeerlang.com/buckets-of-sockets
;;;;
;;;; Work being tracked here:
;;;; * https://github.com/hexagram30/mush/issues/3
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

(include-lib "hxgm30.mush/include/registration.lfe")
(include-lib "logjam/include/logjam.hrl")

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
  `#(ok ,(make-state socket sock
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
     `#(noreply ,(set-state-command st parsed))))
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
  (('accept (= (match-state socket listen-sock session-id id) st))
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
     `#(noreply ,(set-state-socket st accept-sock))))
  (('dispatch st)
   (hxgm30.mush.reg.shell:command-dispatch (self) st)
   `#(noreply ,(set-state-command st '())))
  ((`#(confirm ,conf-code) st)
   ;; XXX Make call to postgres to get saved conf code for session id
   ;; XXX Compare to passed conf code
   ;; XXX Make call to postgres to set confirmed to TRUE is equal
   `#(noreply ,st))
  ((`#(register ,email) st)
   ;; XXX Make call to postgres to set email and session id
   `#(noreply ,(set-state-email st email)))
  ((`#(session-id ,id) st)
   ;; XXX Make call to postgres to get all data WHERE session_id = id
   ;; XXX Update state data with DB results
   `#(noreply ,(set-state-session-id st id)))
  ((`#(ssh-key ,key) st)
   ;; XXX Make call to postgres to set email and session id
   `#(noreply ,(set-state-email st email)))
  (('quit (= (match-state socket sock) st))
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

(defun SERVER () (MODULE))
(defun genserver-opts () '())
(defun unknown-command () #(error "Unknown command."))
