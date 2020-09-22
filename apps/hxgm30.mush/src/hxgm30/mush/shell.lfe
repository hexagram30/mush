(defmodule hxgm30.mush.shell
  (export
   (start 0)))

(defun read ()
  (case (io:get_line "mush> ")
    ("quit\n" "quit")
    (str (let ((`#(ok ,expr) (lfe_io:read_string str)))
           expr))))

(defun mush-eval (expr)
  (lfe_io:format "expression: ~p~n" `(,expr)))

(defun print (result)
  (lfe_io:format "~p~n" `(,result))
  result)

(defun loop
  (("quit")
   'good-bye)
  ((_result)
   (loop (print (mush-eval (read))))))

(defun start ()
  (loop 'start))