(defmodule hxgm30.store.query
  (export all))

(include-lib "logjam/include/logjam.hrl")

(defun insert-tmpl () "INSERT INTO ~s (~s) VALUES (~p)")
(defun select-from-tmpl () "SELECT ~s FROM ~s")
(defun select-from-where-tmpl () "SELECT ~s FROM ~s WHERE ~s")
(defun update-tmpl () "UPDATE ~s SET ~s WHERE ~s")
(defun upsert-tmpl () (++ "INSERT INTO ~s (~s) VALUES (~s) "
                          "ON CONFLICT (~s) DO UPDATE SET ~s"))
(defun upsert-where-tmpl () (++ "INSERT INTO ~s (~s) VALUES (~s) "
                                "ON CONFLICT (~s) DO UPDATE SET ~s WHERE ~s"))
(defun area-table () "area")
(defun char-table () "game_character")
(defun game-table () "game")
(defun pathway-table () "pathway")
(defun user-table () "service_user")

(defun area-columns ()
  "display_name,created_on,description")
(defun area-add-columns ()
  "display_name,created_on,description")
(defun game-columns ()
  "id,display_name,play_type,description,status,created_on,updated_on")
(defun char-columns ()
  "id,game_id,owner_id,display_name,full_name,created_on,updated_on,role")
(defun pathway-columns ()
  "display_name,created_on,description,from_area_id,to_area_id,direction")
(defun pathway-add-columns ()
  "display_name,created_on,description,from_area_id,to_area_id,direction")
(defun user-columns ()
  "id,email,ssh_public_key,created_on,updated_on")

(defun query-args () '())
(defun query-opts ()
  #m(decode_opts (return_rows_as_maps)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Users Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun users ()
  (clj:-> (select-from (user-columns) (user-table))
          (query-all)))

(defun user (id)
  (let ((where (io_lib:format "id=~p" `(,id))))
    (clj:-> (select-from-where (user-columns) (user-table) where)
            (query-one))))

(defun user-conf-code (id)
  (mref (user id) #"confirmation_code"))

(defun user-confirmed? (id)
  (mref (user id) #"confirmed"))

(defun set-user-email (id email)
  (set-user-value id "email" email))

(defun set-user-ssh-key (id key)
  (set-user-value id "ssh_public_key" key))

(defun set-user-conf-code (id conf-code)
  (set-user-value id "confirmation_code" conf-code))

(defun set-user-reg-status (id status)
  (set-user-value id "registration_status" status))

(defun set-user-confirmed (id)
  (set-user-value id "confirmed" 'true))

(defun set-user-value (id column value)
  (let ((columns (io_lib:format "registration_id, ~s" `(,column)))
        (values (io_lib:format "'~s', '~s'" `(,id ,value)))
        (set (io_lib:format "~s = '~s'" `(,column ,value))))
    (clj:-> (upsert (user-table) columns values "registration_id" set)
            (trace-query)
            (transact))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Games Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Characters Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun characters (game-id)
  (let ((where (io_lib:format "game_id=~p" `(,game-id))))
    (clj:-> (select-from-where (char-columns) (char-table) where)
            ;;(trace-query)
            (query-all))))

(defun character (game-id id)
  (let ((where (io_lib:format "game_id=~p AND id=~p" `(,game-id ,id))))
    (clj:-> (select-from-where (char-columns) (char-table) where)
            ;;(trace-query)
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
;;;   Building & Traversing Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun add-area (name desc)
  'tbd)

(defun add-pathway (name desc from to dir)
  'tbd)

(defun area-pathways
  ((id) (when (not (is_list id)))
   (area-pathways (integer_to_list id)))
  ((id)
   (let ((where (io_lib:format "from_area_id=~s" `(,id))))
     (clj:-> (select-from-where (pathway-columns) (pathway-table) where)
             (trace-query)
             (query-all)))))

(defun area-exits (id)
  (lists:map (lambda (x) (mref x #"direction"))
             (area-pathways id)))

(defun direction-lookup (exits-results)
  (lists:map (lambda (x) `#(,(mref x #"direction") ,x)) exits-results))

(defun area
  ((id) (when (not (is_list id)))
   (area (integer_to_list id)))
  ((id)
   (let ((where (io_lib:format "id=~s" `(,id))))
     (clj:-> (select-from-where (area-columns) (area-table) where)
             ;;(trace-query)
             (query-one)))))

(defun area-name (id)
  (mref (area id) #"display_name"))

(defun area-desc (id)
  (mref (area id) #"description"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Utility Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun trace-query (query)
  (log-debug "Trace query: ~s~n" `(,query))
  query)

(defun trace-data (data)
  (log-debug "Trace data: ~p~n" `(,data))
  data)

(defun query-all (sql)
  (clj:-> sql
          (pgo:query (query-args) (query-opts))
          (mref 'rows)))

(defun transact (sql)
  (pgo:transaction
   (lambda ()
     (pgo:query sql (query-args) (query-opts)))))

(defun query-one (sql)
  (car (query-all sql)))

(defun select-from (columns table)
  (io_lib:format (select-from-tmpl) `(,columns ,table)))

(defun select-from-where (columns table where)
  (io_lib:format (select-from-where-tmpl) `(,columns ,table ,where)))

(defun update (table sets where)
  (io_lib:format (update-tmpl) `(,table ,sets ,where)))

(defun upsert (table columns values conflict-column sets)
  (io_lib:format (upsert-tmpl)
                 `(,table ,columns ,values ,conflict-column ,sets)))

(defun upsert-where (table columns values conflict-column sets where)
  (io_lib:format (upsert-where-tmpl)
                 `(,table ,columns ,values ,conflict-column ,sets ,where)))

