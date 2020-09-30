(defmodule hxgm30.mush.reg.shell
  (export
   (banner 1)
   (command-dispatch 2)
   (prompt 0)
   (send-confirmation-email 1)
   (welcome 1)))

(include-lib "logjam/include/logjam.hrl")
(include-lib "hxgm30.mush/include/registration.lfe")

(defun command-dispatch
  ((server (= (match-reg-state command parsed session-id id) st))
   (let ((`(#(cmd ,cmd) ,_ ,_) parsed))
     (case cmd
       ("" (empty st))
       ("banner" (resend-banner st))
       ("confirm" (confirm server st))
       ("email" (email server st))
       ("help" (help st))
       ("id" (id st))
       ("quit" (quit server))
       ("resend" (resend-code server st))
       ("resume" (resume server st))
       ("show-all" (show-all st))
       ("ssh-key" (ssh-key server st))
       ("status" (status st))
       (_ (unknown st))))))

;;; -----------------
;;; command functions
;;; -----------------

(defun confirm
  ((server (match-reg-state socket sock command parsed))
   (let ((`(,_ #(args (,conf-code . ,_)) ,_) parsed))
     (gen_server:cast server `#(confirm ,conf-code))
     (send sock "ok"))))

(defun email
  ((server (match-reg-state socket sock command parsed))
   (let ((`(,_ #(args (,email . ,_)) ,_) parsed))
     (gen_server:cast server `#(register ,email))
     (send sock "Check your email for a confirmation code."))))

(defun empty
  (((match-reg-state socket sock))
   (send sock)))

(defun help
  (((match-reg-state socket sock))
   (send sock  (hxgm30.util:read-priv-file
                (hxgm30.mush.config:reg-help-text)))))

(defun id
  (((match-reg-state socket sock session-id id))
   (send sock id)))

(defun quit (server)
  (gen_server:cast server 'quit))


(defun resend-banner
  (((match-reg-state socket sock session-id id))
   (send sock (banner id) 0)))

(defun resend-code
  ((server (match-reg-state socket sock))
     (gen_server:cast server 'resend-confirmation)
     (send sock "Check your email for a confirmation code.")))

(defun resume
  ((server (match-reg-state socket sock command parsed))
   (let ((`(,_ #(args (,id . ,_)) ,_) parsed))
     (gen_server:cast server `#(session-id ,id))
     (send sock (io_lib:format "Your current session ID is now ~s" `(,id))))))

(defun show-all
  (((= (match-reg-state socket sock session-id id) st))
   (let* ((tmpl (++ "~nData for id = ~s:~n"
                    "* Email address: ~s~n"
                    "* Confirmed status: ~s~n"
                    "* SSH key: ~s~n"))
          (msg (io_lib:format tmpl `(,(reg-state-session-id st)
                                     ,(reg-state-email st)
                                     ,(reg-state-confirmed st)
                                     ,(reg-state-ssh-key st)))))
     (send sock msg))))

(defun ssh-key
  ((server (match-reg-state socket sock command parsed))
   (log-debug "Got parsed: ~p" `(,parsed))
   (let ((`(,_ #(args (,key . ,_)) ,_) parsed))
     (log-debug "Got ssh-key: ~p" `(,key))
     (gen_server:cast server `#(ssh-key ,key))
     (send sock "ok"))))

(defun status
  (((match-reg-state socket sock confirmed confd))
   (case confd
     ('true (send sock "Confirmed."))
     (_ (send sock "Awaiting confirmation.")))))

(defun unknown
  (((match-reg-state socket sock))
   (send sock #"ERROR: unknown command")))

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
                       `(,id))))

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

