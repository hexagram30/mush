(defmodule hxgm30.mush.reg.shell
  (export
   (banner 1)
   (command-dispatch 2)
   (prompt 0)
   (send-confirmation-email 1)
   (welcome 1)))

(include-lib "hxgm30.mush/include/registration.lfe")
(include-lib "logjam/include/logjam.hrl")

(defun command-dispatch
  ((server (= (match-state command parsed session-id id) st))
   (let ((`(#(cmd ,cmd) ,_ ,_) parsed))
     (case cmd
       ("" (empty st))
       ("banner" (resend-banner st))
       ("confirm" (confirm st))
       ("id" (id st))
       ("help" (help st))
       ("quit" (quit server))
       ("register" (register st))
       ("resume" (resume server st))
       ("show-all" (show-all st))
       ("status" (status st))
       (_ (unknown st))))))

;;; -----------------
;;; command functions
;;; -----------------

(defun confirm
  ((server (match-state socket sock command parsed))
   (let ((`(,_ #(args (,conf-code . ,_)) ,_) parsed))
     (gen_server:cast server `#(confirm ,conf-code))
     (send sock
           (io_lib:format "Check your email for a confirmation code.")))))

(defun empty
  (((match-state socket sock))
   (send sock)))

(defun help
  (((match-state socket sock))
   (send sock #"HELP TEXT")))

(defun id
  (((match-state socket sock session-id id))
   (send sock id)))

(defun quit (server)
  (gen_server:cast server 'quit))

(defun register
  ((server (match-state socket sock command parsed))
   (let ((`(,_ #(args (,email . ,_)) ,_) parsed))
     (gen_server:cast server `#(register ,email))
     (send sock
           (io_lib:format "Check your email for a confirmation code.")))))

(defun resend-banner
  (((match-state socket sock session-id id))
   (send sock (banner id) 0)))

(defun resume
  ((server (match-state socket sock command parsed))
   (let ((`(,_ #(args (,id . ,_)) ,_) parsed))
     (gen_server:cast server `#(session-id ,id))
     (send sock (io_lib:format "Your current session ID is now ~s" `(,id))))))

(defun show-all (st)
  (let ((msg (io_lib:format (++ "Data for id=~s:~n"
                                "* Email address: ~s~n"
                                "* Confirmed status: ~s~n"
                                "* SSH key: ~s~n")
                            `(,(state-session-id st)
                              ,(state-email st)
                              ,(state-confirmed st)
                              ,(state-ssh-key st)))))
    (send sock msg)))

(defun ssh-key
  ((server (match-state socket sock command parsed))
   (let ((`(,_ #(args (,key . ,_)) ,_) parsed))
     (gen_server:cast server `#(ssh-key ,key))
     (send sock "ok"))))

(defun status
  (((match-state socket sock confirmed? confd?))
   (case confd?
     ('true (send sock "Confirmed."))
     ('false (send sock "Awaiting confirmation.")))))

(defun unknown
  (((match-state socket sock))
   (send sock #"UNKNOWN COMMAND")))


;;; -----------------
;;; support functions
;;; -----------------

(defun send (sock)
  (send sock "" 0))

(defun send (sock msg)
  (send sock msg 1))

(defun send (sock msg nl-count)
  (hxgm30.util:tcp-send
   sock
   (list msg
         (lists:duplicate nl-count (newline))
         (prompt))))

(defun newline () #"\r\n")
(defun prompt ()  #"registration> ")

(defun banner (id)
  (list (io_lib:format (hxgm30.util:read-priv-file
                        (hxgm30.mush.config:reg-banner))
                       `(,id))
        (newline)
        (newline)))

(defun welcome (id)
  (list (banner id) (prompt)))

(defun send-confirmation-email (to)
  (let ((msg (io_lib:format (hxgm30.util:read-priv-file
                             (hxgm30.mush.config:reg-email-tmpl))
                            `(,(hxgm30.util:confirmation-code to)))))
    (case (sendmail:send `#m(to ,to
                             from ,(hxgm30.mush.config:reg-email-from)
                             subject ,(hxgm30.mush.config:reg-email-subj)
                             message ,msg))
      (`#(0 ,_)
       (log-info "Successfully sent registration email to ~s" `(,to)))
      (`#(,exit-code ,err)
       (log-error "Could not send registration email: ~p" `(,err))))))

