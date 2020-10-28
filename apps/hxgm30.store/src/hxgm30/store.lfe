(defmodule hxgm30.store
  (behaviour gen_server)
  ;; gen_server implementation
  (export
   (start_link 0))
  ;; callback implementation
  (export
   (init 1)
   (handle_call 3)
   (handle_cast 2)
   (handle_info 2)
   (terminate 2)
   (code_change 3))
  ;; server API
  (export
   (echo 1)
   (games 0) (games 1)
   (pid 0)
   (stop 0)))

(include-lib "logjam/include/logjam.hrl")

;;; ----------------
;;; config functions
;;; ----------------

(defun SERVER () (MODULE))
(defun initial-state () '#())
(defun genserver-opts () '())
(defun unknown-command () #(error "Unknown command."))

;;; -------------------------
;;; gen_server implementation
;;; -------------------------

(defun start_link ()
  (gen_server:start_link `#(local ,(SERVER))
                         (MODULE)
                         (initial-state)
                         (genserver-opts)))

(defun stop ()
  (gen_server:call (SERVER) 'stop))

;;; -----------------------
;;; callback implementation
;;; -----------------------

(defun init (state)
  `#(ok ,state))

(defun handle_cast (_msg state)
  `#(noreply ,state))

(defun handle_call
  (('stop _from state)
   `#(stop shutdown ok ,state))
  ((`#(echo ,msg) _from state)
   `#(reply ,msg ,state))
  ((`#(games) _from state)
   `#(reply ,(games-names) ,state))
  ((`#(games abs) _from state)
   `#(reply ,(games-dirs) ,state))
  ((message _from state)
    `#(reply ,(unknown-command) ,state)))

(defun handle_info
  ((`#(EXIT ,_from normal) state)
   `#(noreply ,state))
  ((`#(EXIT ,pid ,reason) state)
   (log-error "Process ~p exited! (Reason: ~p)~n" `(,pid ,reason))
   `#(noreply ,state))
  ((_msg state)
   `#(noreply ,state)))

(defun terminate (_reason _state)
  'ok)

(defun code_change (_old-version state _extra)
  `#(ok ,state))

;;; --------------
;;; server API
;;; --------------

(defun pid ()
  (erlang:whereis (SERVER)))

(defun echo (msg)
  (gen_server:call (SERVER) `#(echo ,msg)))

(defun games ()
  (gen_server:call (SERVER) `#(games)))

(defun games
  (('#(abs))
   (games #(abs true)))
  (('#(abs true))
   (gen_server:call (SERVER) `#(games abs)))
  ((_)
   (games)))

;;; -----------------
;;; support functions
;;; -----------------

(defun games-dirs ()
  "List of absolute paths to each game in the games dir."
  (filelib:wildcard
   (filename:join
    (hxgm30.store.config:games-dir)
    "*")))

(defun games-names ()
  "List of just the relative path / directory names of each game in the games
  dir."
  (lists:map #'filename:basename/1
             (games-dirs)))