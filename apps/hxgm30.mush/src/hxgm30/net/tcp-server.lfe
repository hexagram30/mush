(defmodule hxgm30.net.tcp-server
  (export
   (behaviour_info 1))
  (export
   (start_link 3)
   (stop 1)))

(defun behaviour_info
  (('callbacks)
   '(#(handle_accept 2)
     #(handle_close 2)
     #(handle_data 3)))
  ((_)
   'undefined))

(defun start_link (callback args opts)
  (logger:info "Starting TCP server with [~p, ~p, ~p]"
                `(,callback ,args ,opts))
  (hxgm30.net.tcp.sup:start_link callback args opts))

(defun stop (pid)
  (exit pid 'normal))