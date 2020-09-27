(defmodule hxgm30.registration
  (behaviour hxgm30.net.tcp-server)
  ;; server implementation
  (export
   (start_link 0))
  ;; callback implementation
  (export
   (handle_accept 2)
   (handle_close 2)
   (handle_data 3))
  ;; registration functions
  (export
   (send-confirmation-email 1)))


(include-lib "logjam/include/logjam.hrl")

;;; ---------------------
;;; server implementation
;;; ---------------------

(defun start_link ()
  (log-info "Starting registration server ...")
  (hxgm30.net.tcp-server:start_link
   (MODULE)
   '()
   (application:get_env 'hxgm30.mush 'registration '())))

;;; -----------------------
;;; callback implementation
;;; -----------------------

(defun handle_accept (socket state)
  (log-info "New client connected")
  (gen_tcp:send socket (banner))
  (gen_tcp:send socket (prompt))
  `#(ok ,state))

(defun handle_close (_socket _state)
  (log-info "Closing connection ..."))

(defun handle_data (socket data state)
  (log-debug "Received data: ~p" `(,data))
  (gen_tcp:send socket data)
  `#(ok ,state))

;;; ----------------------
;;; registration functions
;;; ----------------------

(defun send-confirmation-email (to)
  ;; XXX Seems that email address with names + brackets breaks the sendmail
  ;; wrapper right now
  (sendmail:send `#m(to ,to
                     from ,(hxgm30.mush.config:registrar-email)
                     subject "New user account confirmation"
                     message ,(++ "Hello from the Hexagram30 MUSH server!\n\n"
                                  "Either you or someone using this email address "
                                  "has registered as a new user. If it wasn't you, "
                                  "you can ignore this email.\n\n"
                                  "If it was you, "
                                  "in the user registraion service (telnet session), "
                                  "please execute the 'confirm' command with the "
                                  "following confirmation code as an argument:\n\n"
                                  (hxgm30.util:confirmation-code to)))))

;;; -----------------
;;; private functions
;;; -----------------

(defun banner ()
  "BANNER\r\n")

(defun prompt ()
  "registration> \r\n")
