(defmodule hxgm30.store.query
  (export all))

(defun query-opts ()
  #m(decode_opts (return_rows_as_maps)))

(defun users ()
  (let* ((template "SELECT ~p FROM ~p")
         (columns "id,email,ssh_public_key,created_on,updated_on")
         (table "service_user")
         (query-str (io:format template `(,columns ,table))))
    (pgo:query query-str '() (query-opts))))