;;;; This module contains commands that only players with the 'builder' role are
;;;; allowed to call.
(defmodule hxgm30.mush.builder
  (export all))

(defun dig (args opts)
  ;; XXX change to debug log
  (io:format "Digging with args ~p and opts ~p ...~n"
             `(,args ,opts))
  ;; Step 0: get current user's ID
  ;; Step 0.5 does current character have perms for dig command?
  ;; Step 1: get current room's ID
  ;; Step 2: create new area's (set creator)
  ;; Step 3: get area's ID
  ;; Step 4: create a new pathway (set creator) from current room ID to new area ID
  ;; Step 5: get pathway's ID
  )
  