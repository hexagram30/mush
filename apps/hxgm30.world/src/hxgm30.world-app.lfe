(defmodule hxgm30.world-app
  (behaviour gen_server)
  (export
    ;; app implementation
    (start 2)
    (stop 0)))

;;; --------------------------
;;; application implementation
;;; --------------------------

(defun start (_type _args)
  (logger:set_application_level 'hxgm30.world 'all)
  (logger:info "Starting hxgm30.world application ...")
  (hxgm30.world-sup:start_link))

(defun stop ()
  (hxgm30.world-sup:stop)
  'ok)
