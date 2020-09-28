(defmodule hxgm30.mush.app
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
  (log-info "Starting hxgm30.mush application ...")
  (hxgm30.mush.sup:start_link)
  (hxgm30.mush.reg.sup:start_link))

(defun stop ()
  (hxgm30.mush.sup:stop)
  ;; XXX add stop for registration server
  'ok)
