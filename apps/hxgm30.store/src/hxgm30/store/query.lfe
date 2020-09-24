(defmodule hxgm30.store.query
  (export all))

(defun select-from-tmpl () "SELECT ~s FROM ~s")
(defun select-from-where-tmpl () "SELECT ~s FROM ~s WHERE ~s")

(defun game-table () "game")
(defun user-table () "service_user")
(defun char-table () "game_character")

(defun game-columns ()
  "id,display_name,play_type,description,status,created_on,updated_on")
(defun user-columns ()
  "id,email,ssh_public_key,created_on,updated_on")
(defun char-columns ()
  "id,game_id,owner_id,display_name,full_name,created_on,updated_on,role")

(defun query-args () '())
(defun query-opts ()
  #m(decode_opts (return_rows_as_maps)))

(defun games ()
  (clj:-> (select-from (game-columns) (game-table))
          (query-all)))

(defun game (id)
  (let ((where (io_lib:format "id=~p" `(,id))))
    (clj:-> (select-from-where (game-columns) (game-table) where)
            (query-one))))

(defun game-by-name (name)
  (let ((where (io_lib:format "display_name='~s'" `(,name))))
    (clj:-> (select-from-where (game-columns) (game-table) where)
            (query-one))))

(defun game-id (name)
  (mref (game-by-name name) #"id"))

(defun users ()
  (clj:-> (select-from (user-columns) (user-table))
          (query-all)))

(defun user (id)
  (let ((where (io_lib:format "id=~p" `(,id))))
    (clj:-> (select-from-where (user-columns) (user-table) where)
            (query-one))))

(defun characters (game-id)
  (let ((where (io_lib:format "game_id=~p" `(,game-id))))
    (clj:-> (select-from-where (char-columns) (char-table) where)
            (trace-query)
            (query-all))))

(defun character (game-id id)
  (let ((where (io_lib:format "game_id=~p AND id=~p" `(,game-id ,id))))
    (clj:-> (select-from-where (char-columns) (char-table) where)
            (trace-query)
            (query-all))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Roles Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun players (game-id)
  (let ((where (io_lib:format "game_id=~p AND role='player'" `(,game-id))))
    (clj:-> (select-from-where (char-columns) (char-table) where)
            ;;(trace-query)
            (query-all))))

(defun moderators (game-id)
  (let ((where (io_lib:format "game_id=~p AND role='moderator'" `(,game-id))))
    (clj:-> (select-from-where (char-columns) (char-table) where)
            ;;(trace-query)
            (query-all))))

(defun builders (game-id)
  (let ((where (io_lib:format "game_id=~p AND role='builder'" `(,game-id))))
    (clj:-> (select-from-where (char-columns) (char-table) where)
            ;;(trace-query)
            (query-all))))

(defun admins (game-id)
  (let ((where (io_lib:format "game_id=~p AND role='admin'" `(,game-id))))
    (clj:-> (select-from-where (char-columns) (char-table) where)
            ;;(trace-query)
            (query-all))))

(defun wizards (game-id)
  (let ((where (io_lib:format "game_id=~p AND role='wizard'" `(,game-id))))
    (clj:-> (select-from-where (char-columns) (char-table) where)
            ;;(trace-query)
            (query-all))))

(defun role (game-id char-id)
  (let ((where (io_lib:format "game_id=~p AND id=~p" `(,game-id ,char-id))))
    (clj:-> (select-from-where (char-columns) (char-table) where)
            ;;(trace-query)
            (query-one)
            (mref #"role"))))

(defun moderator? (game-id char-id)
  (let ((char-role (role game-id char-id)))
    (or (== #"moderator" char-role)
        (== #"admin" char-role)
        (== #"wizard" char-role))))

(defun builder? (game-id char-id)
  (let ((char-role (role game-id char-id)))
    (or (== #"builder" char-role)
        (== #"wizard" char-role))))

(defun admin? (game-id char-id)
  (let ((char-role (role game-id char-id)))
    (or (== #"admin" char-role)
        (== #"wizard" char-role))))

(defun wizard? (game-id char-id)
  (== #"wizard" (role game-id char-id)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Utility Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun trace-query (query)
  (io:format "~s~n" `(,query))
  query)

(defun query-all (sql)
  (clj:-> sql
          (pgo:query (query-args) (query-opts))
          (mref 'rows)))

(defun query-one (sql)
  (car (query-all sql)))

(defun select-from (columns table)
  (io_lib:format (select-from-tmpl) `(,columns ,table)))

(defun select-from-where (columns table where)
  (io_lib:format (select-from-where-tmpl) `(,columns ,table ,where)))
