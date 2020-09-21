(defmodule hxgm30.world.app
  (behaviour application)
  (export
   ;; app implementation
   (start 2))
  (export
   (stop 0)))

(include-lib "logjam/include/logjam.hrl")

;;; --------------------------
;;; application implementation
;;; --------------------------

(defun start (_type _args)
  (log-info "Starting hxgm30.world application ...")
  (hxgm30.world.sup:start_link))

(defun stop ()
  (hxgm30.world.sup:stop)
  'ok)
