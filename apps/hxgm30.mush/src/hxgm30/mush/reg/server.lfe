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
   (stop 0))
  ;; debug
  (export
   (state 0)))

(include-lib "logjam/include/logjam.hrl")

(defrecord state
  socket
  command)

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
  `#(ok ,(make-state socket sock)))

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
  (('accept (= (match-state socket listen-sock) st))
   (log-debug "Matched accept message.")
   (log-debug "Got listen socket: ~p" `(,listen-sock))
   (log-debug "Got state: ~p" `(,st))
   (log-debug "Waiting for connection ...")
   (let ((`#(ok ,accept-sock) (gen_tcp:accept listen-sock)))
     (log-debug "Got connection on accept socket: ~p" `(,accept-sock))
     (hxgm30.mush.reg.sup:start-socket)
     (log-debug "Sending banner and prompt ...")
     (hxgm30.util:tcp-send accept-sock
                           (hxgm30.mush.reg.shell:welcome))
     (log-debug "Setting new socket in server state ...")
     `#(noreply ,(set-state-socket st accept-sock))))
  (('dispatch (= (match-state command parsed socket listen-sock) st))
   (hxgm30.mush.reg.shell:command-dispatch (self) listen-sock parsed)
   `#(noreply ,(set-state-command st '())))
  (('quit (= (match-state socket sock) st))
   (gen_tcp:close sock)
   `#(stop normal ,st))
  ((msg st)
   (log-debug "Got cast msg: ~p" `(,msg))
   `#(noreply ,st)))

(defun handle_call
  ((`#(state) _from st)
    `#(reply ,st ,st))
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

;;; ---------------
;;; debug functions
;;; ---------------

(defun state ()
  (gen_server:call (SERVER) `#(state)))

;;; -----------------
;;; private functions
;;; -----------------

(defun SERVER () (MODULE))
(defun genserver-opts () '())
(defun unknown-command () #(error "Unknown command."))
