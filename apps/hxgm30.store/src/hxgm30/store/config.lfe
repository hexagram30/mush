(defmodule hxgm30.store.config
  (export
   (default-pgo-pool 0)
   (pgo 0))
  (export
   (default-pgo-pool 1)
   (epg-pool 1)
   (migration-dir 1)
   (read-config 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   System-based Configuration   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; The config functions in this section are specifically for parts of the
;;; project in which the sytem is running and code has access to the env of
;;; that running system.

(defun pgo ()
  (application:get_all_env 'pgo))

(defun default-pgo-pool ()
  (clj:->> (pgo)
           (proplists:get_value 'pools)
           (proplists:get_value 'default)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Script-based Configuration   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; These config functions are specifically for parts of the project that
;;; do not have access to the env of the running systems. As such, they need
;;; to read the config file(s) manually and operate on that file data.

(defun read-config (config-file)
  "file-consult based config reading"
  (let ((`#(ok (,config . ,_)) (file:consult config-file)))
    config))

(defun migration-dir (config)
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
