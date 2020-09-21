(defmodule hxgm30.net.tcp.server
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
  ;; debug
  (export
   (state 0)))

;;; ----------------
;;; config functions
;;; ----------------

(defun SERVER () (MODULE))
(defun initial-state () '#())
(defun genserver-opts () '())
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
    (logger:debug "Calling gen_server:start with args: ~p" `(,genserver-args))
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
   (logger:debug "Normal exit ...")
   `#(noreply ,st))
  ((`#(EXIT ,pid ,reason) st)
   (logger:error "Process ~p exited! (Reason: ~p)~n" `(,pid ,reason))
   `#(noreply ,st))
  (('timeout (= (match-state callback mod
                             socket sock
                             args as
                             parent caller) st))
   (logger:debug "Handling TCP timeout info message ...")
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
   (logger:debug "Handling TCP info message ...")
   (case (call mod 'handle_data sock data as)
     (`#(close ,new-args)
      (gen_tcp:close sock)
      `#(noreply ,(set-state-args st new-args)))
     (`#(ok ,new-args)
      (inet:setopts sock '(#(active once)))
      `#(noreply ,(set-state-args st new-args)))))
  ((`#(tcp_closed ,sock) (= (match-state callback mod
                                         args as) st))
   (logger:debug "Handling TCP closed info message ...")
   (call mod 'handle_close sock as)
   `#(stop normal ,st))
  ((`#(tcp_error ,sock) (= (match-state callback mod
                                         args as) st))
   (logger:debug "Handling TCP error info message ...")
   (call mod 'handle_close sock as)
   `#(stop normal ,st))
  ((msg st)
   (logger:debug "Got unexpected message: ~p" `(,msg))
   `#(noreply ,st)))

(defun handle_cast (msg state)
  (logger:debug "Got cast msg: ~p" `(,msg))
  `#(noreply ,state))

(defun handle_call
  ((`#(state) _from st)
    `#(reply ,st ,st))
  ((msg _from state)
   (logger:debug "Got call msg: ~p" `(,msg))
   `#(reply ,(unknown-command) ,state)))

(defun terminate (_reason _state)
  (logger:info "Terminating ...")
  'ok)

(defun code_change (_old-version state _extra)
  (logger:info "Code change ...")
  `#(ok ,state))

(defun state ()
  (gen_server:call (SERVER) `#(state)))