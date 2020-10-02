(defmodule hxgm30.mush.reg.shell
  (export
   (banner 1)
   (command-dispatch 2)
   (prompt 0)
   (send-confirmation-code 2)
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
       ("exit" (quit server))
       ("help" (help st))
       ("id" (id server st))
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
  ((server (= (match-reg-state command parsed) st))
   (case (check-arg parsed)
     ('() (missing-arg st))
     (conf-code (progn
                  (gen_server:cast server `#(confirm ,conf-code))
                  (send st (++ "Checking; to view confirmation status, use "
                               "the 'status' or 'show-all' command.")))))))

(defun email
  ((server (= (match-reg-state command parsed) st))
   (case (check-arg parsed)
     ('() (missing-arg st))
     (email (progn
              ;; XXX do basic regex check on email!
              (gen_server:cast server `#(register ,email))
              (send st (++ "Setting; to view status, use "
                           "the 'status' or 'show-all' command.")))))))

(defun empty (st)
   (send st))

(defun help (st)
  (send st (hxgm30.util:read-priv-file
            (hxgm30.mush.config:reg-help-text))))

(defun id
  ((server (= (match-reg-state command parsed
                               session-id id) st))
   (case (check-arg parsed)
     ('() (send st id))
     (_ (resume server st)))))

(defun quit (server)
  (gen_server:cast server 'quit))

(defun resend-banner
  (((= (match-reg-state session-id id) st))
   (send st (banner id) 0)))

(defun resend-code
  ((server _st)
     (gen_server:cast server 'resend-confirmation)))

(defun resume
  ((server (= (match-reg-state command parsed) st))
   (case (check-arg parsed)
     ('() (missing-arg st))
     (id (case (hxgm30.util:uuid? id)
           ('true (gen_server:cast server `#(session-id ,id))
                  (send st
                        (io_lib:format "Your current session ID is now ~s"
                                       `(,id))))
           (_ (invalid-uuid st)))))))

(defun show-all
  (((= (match-reg-state session-id id) st))
   (let* ((tmpl (++ "~nData for id = ~s:~n"
                    "* Email address: ~s~n"
                    "* Registration status: ~s~n"
                    "* SSH key: ~s~n"))
          (msg (io_lib:format tmpl `(,(reg-state-session-id st)
                                     ,(reg-state-email st)
                                     ,(reg-state-status st)
                                     ,(reg-state-ssh-key st)))))
     (send st msg))))

(defun ssh-key
  ((server (= (match-reg-state command parsed) st))
   (case (check-key-args parsed)
     (`#(error) (missing-arg st))
     (key (progn
            (log-debug "Got ssh-key: ~p" `(,key))
            (gen_server:cast server `#(ssh-key ,key))
            (send st "ok"))))))

(defun status
  "Note that the source of truth for valid return values are defined in the
  PostgreSQL 'reg_state' ENUM defined in our DB schema. Currently these are
  * initiated - just an email has been provided
  * incomplete - email + one of the other required fields, but not all
  * complete - all required service_user data have been saved"
  (((= (match-reg-state status stts) st))
   (case stts
     ("initiated" (send st "Registration initiated."))
     ("incomplete" (send st (++ "Missing required data and/or "
                                "email verification.")))
     ("complete" (send st (++ "Registration complete! You are ready "
                              "to play ... :-D")))
     ('undefined (send st (++ "You have not started the registration "
                              "process.")))
     (_ (send st "Uknown registration state ... confused :-/")))))

(defun check-key-args
  ((`(,_ #(args ,args) ,_))
   (case args
     (`(,type ,key ,name) (io_lib:format "~s ~s ~s" `(,type ,key ,name)))
     (_ #(error)))))

(defun check-arg
  ((`(,_ #(args ,args) ,_))
   (case args
     ('() args)
     (`(,head . ,_tail) head))))

(defun missing-arg
  (((= (match-reg-state socket sock) st))
   (send st (missing-arg-msg))))

(defun invalid-uuid
  (((= (match-reg-state socket sock) st))
   (send st (invalid-uuid-msg))))

(defun unknown
  (((= (match-reg-state socket sock) st))
   (send st (unknown-msg))))

;;; -----------------
;;; support functions
;;; -----------------

(defun send (st)
  (send st "" 0))

(defun send (st msg)
  (send st msg 1))

(defun send
  (((= (match-reg-state socket sock) st) msg nl-count)
   ;;(log-debug "Preparing to send msg: ~p" `(,msg))
   (hxgm30.util:tcp-send
    sock
    (list msg
          (lists:duplicate nl-count (newline))
          (gather-errors st)
          (gather-messages st)
          (prompt)))))

(defun newline () #"\r\n")
(defun prompt ()  #"registration> ")
(defun missing-arg-msg () #"ERROR: missing argument(s); see 'help' for usage info")
(defun unknown-msg () #"ERROR: unknown command")
(defun invalid-uuid-msg () #"ERROR: provided ID is not a valid UUID")

(defun gather-errors (st)
  (case (reg-state-errors st)
    ('() '())
    (errs (list
           (lists:join (newline) errs)
           (newline)))))

(defun gather-messages (st)
  (case (reg-state-messages st)
    ('() '())
    (msgs (list
           (lists:join (newline) msgs)
           (newline)))))

(defun banner (id)
  (list (io_lib:format (hxgm30.util:read-priv-file
                        (hxgm30.mush.config:reg-banner))
                       `(,id))))

(defun welcome (id)
  (list (banner id) (prompt)))

(defun send-confirmation-code (to conf-code)
  (let ((msg (io_lib:format (hxgm30.util:read-priv-file
                             (hxgm30.mush.config:reg-email-tmpl))
                            `(,conf-code))))
    (case (sendmail:send `#m(to ,to
                             from ,(hxgm30.mush.config:reg-email-from)
                             subject ,(hxgm30.mush.config:reg-email-subj)
                             message ,msg))
      (`#(0 ,_)
       (log-info "Successfully sent registration email to ~s" `(,to)))
      (`#(,exit-code ,err)
       (log-error "Could not send registration email: ~p" `(,err))))))
