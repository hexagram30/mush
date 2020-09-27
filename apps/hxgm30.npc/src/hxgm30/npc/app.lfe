(defmodule hxgm30.npc.app
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
  (log-info "Starting hxgm30.npc application ...")
  (hxgm30.npc.sup:start_link))

(defun stop ()
  (hxgm30.npc.sup:stop)
  'ok)
