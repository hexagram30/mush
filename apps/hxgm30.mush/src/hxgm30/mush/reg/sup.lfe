(defmodule hxgm30.mush.reg.sup
  (behaviour supervisor)
  ;; supervisor implementation
  (export
   (start_link 0))
  ;; callback implementation
  (export
   (init 1)))

(include-lib "logjam/include/logjam.hrl")

;;; ----------------
;;; config functions
;;; ----------------

(defun SERVER () (MODULE))

(defun sup-flags ()
  `#m(strategy simple_one_for_one
      intensity 60
      period 3600))

;;; -------------------------
;;; supervisor implementation
;;; -------------------------

(defun start_link ()
  (log-info "Starting TCP server supervisor ...")
  (supervisor:start_link `#(local ,(SERVER)) (MODULE) '()))

;;; -----------------------
;;; callback implementation
;;; -----------------------

(defun init (_)
  (let* ((port (hxgm30.mush.config:reg-listener-port))
         (sock-opts (hxgm30.mush.config:reg-tcp-opts))
         (listen-sock (gen_tcp:listen port sock-opts)))
    (log-debug "Listening for TCP connections on port ~p" `(,port))
    (spawn_link #'listener-pool/0)
    `#(ok #(,(sup-flags)
            (,(child 'hxgm30.net.tcp.server
                     'start_link
                     `(,listen-sock)))))))

;;; -----------------
;;; private functions
;;; -----------------

(defun child (mod fun args)
  `#m(id ,mod
      start #(,mod ,fun ,args)
      restart temporary
      shutdown 1000
      type worker
      modules (,mod)))

(defun start-socket ()
  (supervisor:start_child (MODULE) '()))

(defun listener-pool ()
  (log-debug "Creating listener pool ...")
  (list-comp
    ((<- _ (lists:seq 1 (hxgm30.mush.config:reg-listener-pool-size))))
    (start-socket)))