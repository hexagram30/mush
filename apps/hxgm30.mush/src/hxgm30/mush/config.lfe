(defmodule hxgm30.mush.config
  (export
   (prompt 0)
   (reg 0)
   (reg-email 0)
   (reg-listener 0)
   (reg-listener-pool-size 0)
   (reg-listener-port 0)
   (reg-tcp-opts 0)
   (shell 0)
   (shell-wrap-width 0)))

(defun prompt ()
  (proplists:get_value 'prompt (shell)))

(defun reg ()
  (application:get_env 'hxgm30.mush 'registration '()))

(defun reg-email ()
  (proplists:get_value 'registrar-email (reg)))

(defun reg-listener ()
  (proplists:get_value 'listener (reg)))

(defun reg-listener-pool-size ()
  (proplists:get_value 'pool-size (reg-listener)))

(defun reg-listener-port ()
  (proplists:get_value 'port (reg-listener)))

(defun reg-tcp-opts ()
  (proplists:get_value 'tcp-opts (reg)))

(defun shell ()
  (application:get_env 'hxgm30.mush 'shell '()))

(defun shell-wrap-width ()
  (proplists:get_value 'text-width (shell)))
