(defmodule hxgm30.mail-app
  (behaviour gen_server)
  (export
    ;; app implementation
    (start 2)
    (stop 0)))

;;; --------------------------
;;; application implementation
;;; --------------------------

(defun start (_type _args)
  (logger:set_application_level 'hxgm30.mail 'all)
  (logger:info "Starting hxgm30.mail application ...")
  (hxgm30.mail-sup:start_link))

(defun stop ()
  (hxgm30.mail-sup:stop)
  'ok)
