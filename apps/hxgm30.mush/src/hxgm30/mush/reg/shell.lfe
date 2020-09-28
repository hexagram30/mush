(defmodule hxgm30.mush.reg.shell
  (export
   (banner 0)
   (command-dispatch 3)
   (prompt 0)
   (send-confirmation-email 1)
   (welcome 0)))

(include-lib "logjam/include/logjam.hrl")

(defun command-dispatch
  ((server sock `(#(cmd ,cmd) #(args ,args) #(opts ,opts)))
   (case cmd
     ("help" (send sock #"HELP TEXT"))
     ("" (send sock))
     ("quit" (gen_server:cast server 'quit))
     (_ (send sock #"UNKNOWN COMMAND")))))

(defun send (sock)
  (send sock "" 0))

(defun send (sock msg)
  (send sock msg 2))

(defun send (sock msg nl-count)
  (hxgm30.util:tcp-send
   sock
   (list msg
         (lists:duplicate nl-count (newline))
         (prompt))))

(defun newline () #"\r\n")
(defun prompt ()  #"registration> ")

(defun banner ()
  (list (hxgm30.util:read-priv-file
         (hxgm30.mush.config:reg-banner))
        (newline)
        (newline)))

(defun welcome ()
  (list (banner) (prompt)))

(defun send-confirmation-email (to)
  (let (;; XXX move subject text to sys.config
        (subj "New user account confirmation")
        ;; XXX move msg content to priv text/confirm.email and then
        ;; read with hxgm30.util:read-priv-file/1
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
                             from ,(hxgm30.mush.config:reg-email)
                             subject ,subj
                             message ,msg))
      (`#(0 ,_)
       (log-info "Successfully sent registration email to ~s" `(,to)))
      (`#(,exit-code ,err)
       (log-error "Could not send registration email: ~p" `(,err))))))

