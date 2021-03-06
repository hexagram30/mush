(defmodule hxgm30.util
  (export
   (confirmation-code 1)
   (email? 1)
   (read-priv-file 1)
   (tcp-send 2)
   (uuid? 1)
   (uuid3 1) (uuid3 2)
   (uuid4 0) (uuid4 1)
   (uuid->ascii-quad 1)))

(include-lib "logjam/include/logjam.hrl")

(defun ascii-a () 65)
(defun alphabet-len () 25)
(defun app () 'hxgm30.mush)
;;(defun invalid-uuid () #"ERROR: invalid UUID")

(defun uuid3 (data)
  (uuid3 data #m()))

(defun uuid3
  ((data opts) (when (is_list data))
   (uuid3 (list_to_binary data) opts))
  ((data `#m(return string))
   (uuid:uuid_to_string (uuid:get_v3 data)))
  ((data _)
   (uuid:get_v3 data)))

(defun uuid4 ()
  (uuid4 #m()))

(defun uuid4
  ((`#m(return string))
   (uuid:uuid_to_string (uuid:get_v4 'strong)))
  ((_)
   (uuid:get_v4)))

(defun uuid?
  ((id) (when (is_bitstring id))
   (uuid? (erlang:bitstring_to_list id)))
  ((id) (when (is_binary id))
   (try
     (uuid:is_uuid id)
     (catch (`#(,_ ,_ ,_)
       'false))))
  ((id) (when (is_list id))
   (try
     (uuid:is_uuid (uuid:string_to_uuid id))
     (catch (`#(,_ ,_ ,_)
       'false))))
  ((_)
   'false))
       
  
(defun confirmation-code
  ((data) (when (is_list data))
   (confirmation-code (list_to_binary data)))
  ((data)
   (++ (uuid->ascii-quad (uuid3 data))
       "-"
       (uuid->ascii-quad (uuid4)))))

(defun ->ascii-upper (int-list)
  (+ (ascii-a) (rem (lists:sum int-list) (alphabet-len))))

(defun uuid->ascii-quad
  ((data) (when (not (is_binary data)))
   #(error "UUID must be in binary form"))
  ((data)
   (lists:map #'->ascii-upper/1
              (clj:partition 4 (binary:bin_to_list data)))))

(defun tcp-send (sock iolist)
  (case (gen_tcp:send sock iolist)
    ('ok (case (inet:setopts sock `(#(active once)))
           ('ok 'ok)
           (err (log-error "~p" `(,err)))))
    (err (progn
           (log-warn "Problem sending data: ~p" `(,iolist))
           (log-error "~p" `(,err))
           err))))

(defun read-priv-file (rel-path)
  (let ((filename (filename:join (code:priv_dir (app))
                                 rel-path)))
    (case (file:read_file filename)
      (`#(ok ,data) data)
      (err (progn
             (log-warn "Problem reading file: ~p" `(,filename))
             (log-error "~p" `(,err)))))))

(defun email? (text)
  "Taken from:
  * https://github.com/zotonic/z_stdlib/blob/master/src/z_email_utils.erl"
  (case (re:run text (email-regex) '(extended))
    ('nomatch 'false)
    (`#(match ,_) 'true)))

(defun email-regex ()
  "Taken from:
  * https://github.com/zotonic/z_stdlib/blob/master/src/z_email_utils.erl"
  "^(
            (\"[^\"\\f\\n\\r\\t\\v\\b]+\")
        |   ([\\w\\!\\#\\$\\%\\&\\'\\*\\+\\-\\~\\/\\^\\`\\|\\{\\}]+
                (\\.[\\w\\!\\#\\$\\%\\&\\'\\*\\+\\-\\~\\/\\^\\`\\|\\{\\}]+)*
            )
    )
    @
    (
        (
            ([A-Za-z0-9\\-])+\\.
        )+
        [A-Za-z\\-]{2,}
    )$")