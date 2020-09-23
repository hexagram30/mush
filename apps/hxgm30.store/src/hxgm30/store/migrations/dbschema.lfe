(defmodule hxgm30.store.migrations.dbschema
  (export
   (migrate 2)
   (startup 1)
   (shutdown 0)))

(defun migrate
  ((migration-dir `(,direction)) (when (is_binary direction))
   (migrate migration-dir
            `(,(list_to_atom (binary_to_list direction)))))
  ((migration-dir `(,direction))
   (call 'dbschema direction migration-dir))
  ((migration-dir `(,direction ,version)) (when (is_binary direction))
   (migrate migration-dir
            `(,(list_to_atom (binary_to_list direction))
              ,(binary_to_list version))))
  ((migration-dir `(,direction ,version))
   (call 'dbschema direction migration-dir version)))

(defun startup (config)
  (application:set_env (hxgm30.store.config:epg-pool config))
  (application:ensure_all_started 'dbschema))

(defun shutdown ()
  (application:stop 'dbschema)
  (erlang:halt 0))