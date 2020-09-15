(defmodule hxgm30.store-app
  (behaviour gen_server)
  (export
    ;; app implementation
    (start 2)
    (stop 0)))

;;; --------------------------
;;; application implementation
;;; --------------------------

(defun start (_type _args)
  (logger:set_application_level 'hxgm30.store 'all)
  (logger:info "Starting hxgm30.store application ...")
  (hxgm30.store-sup:start_link))

(defun stop ()
  (hxgm30.store-sup:stop)
  'ok)
