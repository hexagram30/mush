(defmodule hxgm30.mush.reg.sup
  (behaviour supervisor)
  ;; supervisor implementation
  (export
   (start_link 3)
   (start_child 1))
  ;; callback implementation
  (export
   (init 1)))

(include-lib "logjam/include/logjam.hrl")

;;; ----------------
;;; config functions
;;; ----------------

;;(defun SERVER () (MODULE))
(defun sup-flags ()
  `#m(strategy simple_one_for_one
      intensity 1000
      period 3600))

(defun default-socket-opts ()
  '(binary #(active false) #(reuseaddr true)))

;;; -------------------------
;;; supervisor implementation
;;; -------------------------

(defun start_link (callback args opts)
  (log-info "Starting TCP server supervisor ...")
  (let (((= `#(ok ,pid) started) (supervisor:start_link (MODULE)
                                                        `(,callback ,args ,opts))))
    (start_child pid)
    started))

(defun start_child (pid)
  (supervisor:start_child pid '()))

;;; -----------------------
;;; callback implementation
;;; -----------------------

(defun init
  ((`(,callback ,args ,opts))
   (log-debug "Initializing TCP server supervisor with options: ~p" `(,opts))
   (let* ((port  (proplists:get_value 'port opts))
          (socket-opts (proplists:delete
                        'port
                        (lists:append opts (default-socket-opts))))
          (listen (gen_tcp:listen port socket-opts)))
     (log-info "Listening for TCP connections on port ~p" `(,port))
     `#(ok #(,(sup-flags) (,(child 'hxgm30.net.tcp.server
                                   'start_link
                                   `(,callback ,listen ,args ,socket-opts))))))))

;;; -----------------
;;; private functions
;;; -----------------

(defun child (mod fun args)
  `#m(id ,mod
      start #(,mod ,fun ,args)
      restart temporary
      shutdown brutal_kill
      type worker
      modules (,mod)))
