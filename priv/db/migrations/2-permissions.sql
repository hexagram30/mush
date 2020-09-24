-- Up

CREATE TYPE roles AS ENUM (
       'player',
       'moderator',
       'builder',
       'admin',
       'wizard'
);

ALTER TABLE game ADD COLUMN created_on TIMESTAMP;
ALTER TABLE game ADD COLUMN updated_on TIMESTAMP;

ALTER TABLE game_character ADD COLUMN role roles;

CREATE INDEX game_character_game_id_idx ON game_character(game_id);
CREATE INDEX game_character_role_idx ON game_character(role);

CREATE INDEX pathway_from_area_idx ON pathway(from_area_id);
CREATE INDEX pathway_to_area_idx ON pathway(to_area_id);

INSERT INTO service_user (id, email, created_on)
       VALUES (1, 'root@hxgm30.mush', current_timestamp);

INSERT INTO game (id, display_name, created_on, status)
       VALUES (1, 'The Game of MUSH', current_timestamp, 'created');

INSERT INTO game_character (owner_id, game_id, role, display_name, created_on)
       VALUES (1, 1, 'player', 'Myka', current_timestamp);
INSERT INTO game_character (owner_id, game_id, role, display_name, created_on)
       VALUES (1, 1, 'moderator', 'Hartig', current_timestamp);
INSERT INTO game_character (owner_id, game_id, role, display_name, created_on)
       VALUES (1, 1, 'builder', 'Hyphay', current_timestamp);
INSERT INTO game_character (owner_id, game_id, role, display_name, created_on)
       VALUES (1, 1, 'admin', 'Basidia', current_timestamp);
INSERT INTO game_character (owner_id, game_id, role, display_name, created_on)
       VALUES (1, 1, 'wizard', 'Psilofyr', current_timestamp);

INSERT INTO area (display_name, created_on, description)
       VALUES ('The MUSH Room', current_timestamp, 'You are in a large, low-lit, warm room. The floor and walls are soft but firm, with a bit of a bounce. There is a distinctive oder about the place.');

-- Down

DROP INDEX pathway_to_area_idx;
DROP INDEX pathway_from_area_idx;

DROP INDEX game_character_game_id_idx;
DROP INDEX game_character_role_idx;

TRUNCATE TABLE area RESTART IDENTITY CASCADE;
TRUNCATE TABLE game_character RESTART IDENTITY CASCADE;
TRUNCATE TABLE game RESTART IDENTITY CASCADE;
TRUNCATE TABLE service_user RESTART IDENTITY CASCADE;

ALTER TABLE game_character DROP COLUMN role;

ALTER TABLE game DROP COLUMN created_on;
ALTER TABLE game DROP COLUMN updated_on;

DROP TYPE roles;
