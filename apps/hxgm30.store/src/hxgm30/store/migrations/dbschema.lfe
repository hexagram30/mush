(defmodule hxgm30.store.migrations.dbschema
  (export
   (dir 1)
   (migrate 2)
   (read-config 1)
   (startup 1)
   (shutdown 0)))

(defun read-config (config-file)
  (let ((`#(ok (,config . ,_)) (file:consult config-file)))
    config))

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

(defun dir (config)
  (clj:->> config
           (proplists:get_value 'dbschema)
           (proplists:get_value 'migration-dir)))

(defun default-pgo-pool (config)
  (clj:->> config
           (proplists:get_value 'pgo)
           (proplists:get_value 'pools)
           (proplists:get_value 'default)))

(defun epg-pool (config)
  (let ((dbcfg (default-pgo-pool config)))
    `(#(epgpool (#(database_host ,(mref dbcfg 'host))
                 #(database_port ,(mref dbcfg 'port))
                 #(database_user ,(mref dbcfg 'user))
                 #(database_password ,(mref dbcfg 'password))
                 #(database_name ,(mref dbcfg 'database)))))))

(defun startup (config)
  (let ((dbcfg (epg-pool config)))
    (application:set_env dbcfg)
    (application:ensure_all_started 'dbschema)))

(defun shutdown ()
  (application:stop 'dbschema)
  (erlang:halt 0))