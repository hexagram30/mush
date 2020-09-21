(defmodule hxgm30.mush.app
  (behaviour application)
  (export
    ;; app implementation
    (start 2)
    (stop 0)))

;;; --------------------------
;;; application implementation
;;; --------------------------

(defun start (_type _args)
  (logger:set_application_level 'hxgm30.mush 'all)
  (logger:info "Starting hxgm30.mush application ...")
  (hxgm30.mush.sup:start_link)
  (hxgm30.registration:start_link))

(defun stop ()
  (hxgm30.mush.sup:stop)
  'ok)
