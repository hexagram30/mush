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
   (start_link 4))
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
  ;; registration api
  (export
   (send-confirmation-email 1))
  ;; debug
  (export
   (state 0)))

(include-lib "logjam/include/logjam.hrl")

;;; ----------------
;;; config functions
;;; ----------------

(defun SERVER () (MODULE))
(defun unknown-command () #(error "Unknown command."))

(defrecord state
  callback
  socket
  args
  opts
  parent)

;;; -------------------------
;;; gen_server implementation
;;; -------------------------

(defun start_link (callback listen args opts)
  (let ((genserver-args `(,callback ,listen ,args ,opts ,(self)))
        (genserver-opts '()))
    (log-debug "Calling gen_server:start with args: ~p" `(,genserver-args))
    (gen_server:start_link `#(local ,(SERVER))
                           (MODULE)
                           genserver-args
                           genserver-opts)))

;;; -----------------------
;;; callback implementation
;;; -----------------------

(defun init
  ((`(,tcp-server ,listen ,args ,opts ,caller))
  `#(ok ,(make-state callback tcp-server
                     socket listen
                     args args
                     opts opts
                     parent caller))))

(defun handle_info
  ((`#(EXIT ,_from normal) st)
   (log-debug "Normal exit ...")
   `#(noreply ,st))
  ((`#(EXIT ,pid ,reason) st)
   (log-error "Process ~p exited! (Reason: ~p)~n" `(,pid ,reason))
   `#(noreply ,st))
  (('timeout (= (match-state callback mod
                             socket sock
                             args as
                             parent caller) st))
   (log-debug "Handling TCP timeout info message ...")
   (let ((`#(ok ,client-sock) (gen_tcp:accept sock)))
     (case (call mod 'handle_accept client-sock as)
       (`#(close ,new-args)
        (gen_tcp:close client-sock)
        `#(noreply ,(set-state-args st new-args)))
       (`#(ok ,new-args)
        (hxgm30.net.tcp.sup:start_child caller)
        (inet:setopts client-sock '(#(active once)))
        `#(noreply (set-state st socket client-socket args new-args))))))
  ((`#(tcp ,sock ,data) (= (match-state callback mod
                                        args as) st))
   (log-debug "Handling TCP info message ...")
   (case (call mod 'handle_data sock data as)
     (`#(close ,new-args)
      (gen_tcp:close sock)
      `#(noreply ,(set-state-args st new-args)))
     (`#(ok ,new-args)
      (inet:setopts sock '(#(active once)))
      `#(noreply ,(set-state-args st new-args)))))
  ((`#(tcp_closed ,sock) (= (match-state callback mod
                                         args as) st))
   (log-debug "Handling TCP closed info message ...")
   (call mod 'handle_close sock as)
   `#(stop normal ,st))
  ((`#(tcp_error ,sock) (= (match-state callback mod
                                         args as) st))
   (log-debug "Handling TCP error info message ...")
   (call mod 'handle_close sock as)
   `#(stop normal ,st))
  ((msg st)
   (log-debug "Got unexpected message: ~p" `(,msg))
   `#(noreply ,st)))

(defun handle_cast (msg state)
  (log-debug "Got cast msg: ~p" `(,msg))
  `#(noreply ,state))

(defun handle_call
  ((`#(state) _from st)
    `#(reply ,st ,st))
  ((msg _from st)
   (log-debug "Got call msg: ~p" `(,msg))
   `#(reply ,(unknown-command) ,st)))

(defun terminate (_reason _st)
  (log-info "Terminating ...")
  'ok)

(defun code_change (_old-version st _extra)
  (log-info "Code change ...")
  `#(ok ,st))

;;; --------------------
;;; additional functions
;;; --------------------

(defun stop ()
  'ok)

;;; ----------------------
;;; registration functions
;;; ----------------------

(defun send-confirmation-email (to)
  (let ((subj "New user account confirmation")
        (msg (++ "Hello from the Hexagram30 MUSH server!\n\n"
                 "Either you or someone using this email address "
                 "has registered as a new user. If it wasn't you, "
                 "you can ignore this email.\n\n"
                 "If it was you, "
                 "in the user registraion service (telnet session), "
                 "please execute the 'confirm' command with the "
                 "following confirmation code as an argument:\n\n"
                 (hxgm30.util:confirmation-code to))))
    (case (sendmail:send `#m(to ,to
                             from ,(hxgm30.mush.config:registrar-email)
                             subject ,subj
                             message ,msg))
      (`#(0 ,_)
       (log-info "Successfully sent registration email to ~s" `(,to)))
      (`#(,exit-code ,err)
       (log-error "Could not send registration email: ~p" `(,err))))))

(defun banner ()
  "BANNER\r\n")

(defun prompt ()
  "registration> \r\n")

;;; ---------------
;;; debug functions
;;; ---------------

(defun state ()
  (gen_server:call (SERVER) `#(state)))