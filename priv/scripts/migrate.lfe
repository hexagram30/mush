#! /usr/bin/env lfescript

;;; --------------------
;;; entry point function
;;; --------------------

(defun main
  ((`(,config-file . ,args))
   (let* ((config (hxgm30.store.migrations.dbschema:read-config config-file))
          (dir (hxgm30.store.migrations.dbschema:dir config)))
     (io:format "Running migration files from ~p ...~n" `(,dir))
     (lfe_io:format "Using config: ~p~n" `(,config))
     (hxgm30.store.migrations.dbschema:startup config)
     ;;(timer:sleep 2000)
     (hxgm30.store.migrations.dbschema:migrate dir args)
     ;;(timer:sleep 2000)
     ;;(hxgm30.store.migrations.dbschema:shutdown)
     ;;(timer:sleep 2000)
     )))
