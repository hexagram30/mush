(defrecord reg-state
  socket
  command
  (errors '())
  (messages '())
  session-id
  email
  ssh-key
  status
  confirmed)
