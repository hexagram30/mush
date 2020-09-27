(defmodule hxgm30.mush.config
  (export
   (prompt 0)
   (registrar-email 0)
   (registration 0)
   (shell 0)
   (shell-wrap-width 0)))

(defun prompt ()
  (proplists:get_value 'prompt (shell)))

(defun shell ()
  (application:get_env 'hxgm30.mush 'shell '()))

(defun shell-wrap-width ()
  (proplists:get_value 'text-width (shell)))

(defun registration ()
  (application:get_env 'hxgm30.mush 'registration '()))

(defun registrar-email ()
  (proplists:get_value 'registrar-email (registration)))