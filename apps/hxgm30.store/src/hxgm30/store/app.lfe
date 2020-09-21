(defmodule hxgm30.store.app
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
  (log-info "Starting hxgm30.store application ...")
  (hxgm30.store.sup:start_link))

(defun stop ()
  (hxgm30.store.sup:stop)
  'ok)
