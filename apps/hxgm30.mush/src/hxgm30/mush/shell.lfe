(defmodule hxgm30.mush.shell
  (export all))

(include-lib "logjam/include/logjam.hrl")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Main REPL Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun read ()
  ;; XXX add scan function for properly handling:
  ;; 1. role-specific commands
  ;; 2. options data syntax
  (tokenize (io:get_line (hxgm30.mush.config:prompt))))

(defun evaluate
  (((= `(#(cmd ,cmd) #(args ,args) #(opts ,opts)) tokens))
   (log-debug "tokens: ~p~n" `(,tokens))
   (command-dispatch cmd args opts)))

(defun print (result)
  (io:format "~s~n" `(,result))
  result)

(defun loop
  ;; Loop-exiting operations
  (('quit)
   'good-bye)
  ;; Continue looping
  ((_)
   (loop (print (evaluate (read))))))

(defun start ()
  (loop 'start))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Constants   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun word-sep () " \r\n")
(defun pair-seps () "<|>")
(defun default-prompt () "hxgm30> ")
(defun default-tokens () '(#(cmd "") #(args '()) #(opts '())))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Support Functions   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Read-phase

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

;;; Eval-phase

(defun legal-directions ()
  '("north" "n"
    "east" "e"
    "south" "s"
    "west" "w"
    "ne"
    "nw"
    "se"
    "sw"
    "up" "u"
    "down" "d"
    "inwards" "in"
    "outwards" "out"
    "enter"
    "leave"))

(defun legal-direction? (dir)
  (lists:member dir (legal-directions)))

(defun legal-move-commands ()
  '("go" "move" "head"))

(defun move? (cmd)
  (lists:member cmd (legal-move-commands)))

(defun normalize-direction (dir)
  (case dir
    ("n" "north")
    ("e" "east")
    ("s" "south")
    ("w" "west")
    ("u" "up")
    ("d" "down")
    ("in" "inwards")
    ("out" "outwards")
    (_ dir)))

(defun command-dispatch (cmd args opts)
  (cond
   ;; Player commands
   ((legal-direction? cmd) (move cmd args))
   ((and (move? cmd) (legal-direction? (car args))) (move (car args) (cdr args)))
   ((== "look" cmd) (look args))
   ((== "help" cmd) (help))
   ((== "quit" cmd) 'quit)
   ((== "whoami" cmd) (hxgm30.mush.cmd.player:whoami args opts))
   ;; Builder commands
   ((== "dig" cmd) (hxgm30.mush.cmd.builder:dig args opts))
   ;; Fall-through
   ('true (unkn-cmd cmd))))

(defun unkn-cmd (cmd)
  (io:format "Unknown command: ~p~n" `(,cmd)))

(defun help ()
  (io:format "~n*** HELP ***~n~n" '()))

(defun look
  ;; XXX update once there are user sessions and IDs don't need to be passed
  ;; anymore
  ((`(,id . ,_))
   (hxgm30.mush.cmd.player:look id)))

(defun move
  ;; XXX update once there are user sessions and IDs don't need to be passed
  ;; anymore
  ((dir `(,id . ,_))
   (log-debug "ID, direction: ~p, ~p" `(,id ,dir))
   (hxgm30.mush.cmd.player:move id (normalize-direction dir))))

