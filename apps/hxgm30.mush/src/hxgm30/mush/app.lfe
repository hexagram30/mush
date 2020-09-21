(defmodule hxgm30.mush.app
  (behaviour application)
  (export
    ;; app implementation
    (start 2)
    (stop 0)))

(include-lib "logjam/include/logjam.hrl")

;;; --------------------------
;;; application implementation
;;; --------------------------

(defun start (_type _args)
  (log-debug "Starting hxgm30.mush application ...")
  (hxgm30.mush.sup:start_link)
  (hxgm30.registration:start_link))

(defun stop ()
  (hxgm30.mush.sup:stop)
  'ok)
