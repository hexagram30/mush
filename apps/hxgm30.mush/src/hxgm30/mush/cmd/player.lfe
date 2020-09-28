;;;; This module contains commands that all players are allowed to call.
(defmodule hxgm30.mush.cmd.player
  (export all))

(include-lib "logjam/include/logjam.hrl")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Metadata Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun id ()
  'undefined)

(defun whoami (args opts)
  'undefined)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Examination Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun where (area-id)
  (format (++ "Location: " (hxgm30.store.query:area-name area-id))))

(defun look (area-id)
  (++
   (where area-id)
   (format (hxgm30.store.query:area-desc area-id))
   (exits area-id)))

(defun exits (area-id)
  (format (++ "Exits: "
              (lists:join ", " (hxgm30.store.query:area-exits area-id)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Movement Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun no-exit-error ()
  "Movement in that direction is not possible here.")

(defun move
  ((current-area-id direction) (when (is_list direction))
   (move current-area-id (list_to_binary direction)))
  ((current-area-id direction)
   (log-debug "ID, direction: ~p, ~p" `(,current-area-id ,direction))
   (let* ((pathways (hxgm30.store.query:area-pathways current-area-id))
          (directions (hxgm30.store.query:direction-lookup pathways)))
     (log-debug "Direction lookup: ~p~n" `(,directions))
     (case (lists:member direction (proplists:get_keys directions))
       ('false (no-exit-error))
       ('true (let ((new-area (mref (proplists:get_value direction directions)
                                    #"to_area_id")))
                ;; XXX update player location to be this new-area
                (look new-area)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Utility Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun format-tmpl () "~n~s~n")
(defun format-data-tmpl () "~n~p~n")

(defun format (io-list)
  (wrap-text (io_lib:format (format-tmpl) `(,io-list))
             (hxgm30.mush.config:shell-wrap-width)))

(defun format-data (data)
  (lfe_io_pretty:term data))

(defun make-regex-str (max-len)
  (++ "(.{1," (integer_to_list max-len) "}|\\S{"
      (integer_to_list (+ max-len 1)) ",})(?:\\s[^\\S\\r\\n]*|\\Z)"))

(defun wrap-text (text max-len)
  (let ((find-patt (make-regex-str max-len))
        (replace-patt "\\1\\\n"))
    (re:replace text find-patt replace-patt
                '(global #(return list)))))