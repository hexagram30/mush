(defmodule hxgm30.registration
  (behaviour hxgm30.net.tcp-server)
  ;; server implementation
  (export
   (start_link 0))
  (export
    ;; callback implementation
    (handle_accept 2)
    (handle_close 2)
    (handle_data 3)))

;;; ---------------------
;;; server implementation
;;; ---------------------

(defun start_link ()
  (logger:info "Starting registration server ...")
  (hxgm30.net.tcp-server:start_link
   (MODULE)
   '()
   (application:get_env 'hxgm30.mush 'registration '())))

;;; -----------------------
;;; callback implementation
;;; -----------------------

(defun handle_accept (socket state)
  (logger:info "New client connected")
  (gen_tcp:send socket (banner))
  (gen_tcp:send socket (prompt))
  `#(ok ,state))

(defun handle_close (_socket _state)
  (logger:info "Closing connection ..."))

(defun handle_data (socket data state)
  (logger:info "Received data: ~p" `(,data))
  (gen_tcp:send socket data)
  `#(ok ,state))

;;; -----------------
;;; private functions
;;; -----------------

(defun banner ()
  "BANNER\r\n")

(defun prompt ()
  "registration> \r\n")