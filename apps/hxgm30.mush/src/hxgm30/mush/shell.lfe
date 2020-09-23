(defmodule hxgm30.mush.shell
  (export all))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Main REPL Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun read ()
  (tokenize (io:get_line (prompt))))

(defun mush-eval
  (((= `(#(cmd ,cmd) #(args ,args) #(opts ,opts)) tokens))
   ;; XXX change to debug log
   (lfe_io:format "tokens: ~p~n" `(,tokens))
   (case cmd
     ;; player commands
     ("help" (help))
     ("quit" 'quit)
     ("whoami" (hxgm30.mush.player:whoami args opts))
     ;; builder commands
     ("dig" (hxgm30.mush.builder:dig args opts))
     ;; unknown command
     (_ tokens))))

(defun print (result)
  (lfe_io:format "~p~n" `(,result))
  result)

(defun loop
  (('quit)
   'good-bye)
  ((_)
   (loop (print (mush-eval (read))))))

(defun start ()
  (loop 'start))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Constants   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun word-sep () " \n")
(defun pair-seps () "<|>")
(defun default-prompt () "hxgm30> ")
(defun default-tokens () '(#(cmd "") #(args '()) #(opts '())))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Support Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun help ()
  (io:format "~n*** HELP ***~n~n" '()))

(defun prompt ()
  (proplists:get_value
   'prompt
   (application:get_env 'hxgm30.mush 'shell (default-prompt))))

(defun tokenize (string)
  (case (lists:map #'tokenize-option/1
                   (tokenize-command string))
    ('()
     (default-tokens))
    (`(,cmd . ,raw-tokens)
     `(#(cmd ,cmd)
       #(args ,(lists:filter (lambda (x) (not (is_tuple x))) raw-tokens))
       #(opts ,(lists:filter #'is_tuple/1 raw-tokens))))))

(defun tokenize-command (string)
  (string:lexemes string (word-sep)))

(defun tokenize-option (string)
  (case (string:lexemes string (pair-seps))
    (`(,k ,v) `#(,k ,v))
    (token (car token))))