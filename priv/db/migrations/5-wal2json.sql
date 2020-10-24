-- Up

SELECT 'init' FROM pg_create_logical_replication_slot('mush_slot', 'wal2json');

-- Down

SELECT 'stop' FROM pg_drop_replication_slot('mush_slot');
