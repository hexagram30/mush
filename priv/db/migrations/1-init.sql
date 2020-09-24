-- Up

CREATE EXTENSION IF NOT EXISTS citext;

CREATE TABLE service_user (
       id SERIAL PRIMARY KEY,
       email CITEXT UNIQUE,
       ssh_public_key TEXT,
       created_on TIMESTAMP,
       updated_on TIMESTAMP
);

CREATE TYPE game_state AS ENUM (
       'created',
       'stopped',
       'starting',
       'stopping',
       'running'
);

CREATE TABLE game (
       id SERIAL PRIMARY KEY,
       display_name VARCHAR(255),
       play_type VARCHAR(255),
       description TEXT,
       status game_state
);

CREATE TABLE game_character (
       id SERIAL PRIMARY KEY,
       owner_id INTEGER REFERENCES service_user(id),
       game_id INTEGER REFERENCES game(id),
       display_name VARCHAR(255) UNIQUE,
       full_name VARCHAR(255) UNIQUE,
       created_on TIMESTAMP,
       updated_on TIMESTAMP
);

CREATE TABLE area (
       id SERIAL PRIMARY KEY,
       display_name VARCHAR(255),
       created_on TIMESTAMP,
       updated_on TIMESTAMP,
       description TEXT
);

CREATE TABLE pathway (
       id SERIAL PRIMARY KEY,
       display_name VARCHAR(255),
       created_on TIMESTAMP,
       updated_on TIMESTAMP,
       description TEXT,
       from_area_id INTEGER REFERENCES area(id),
       to_area_id INTEGER REFERENCES area(id),
       -- while in the from_area, in what direction is the to_area?
       direction VARCHAR(32)
);

CREATE INDEX pathway_direction_idx ON pathway(direction);

CREATE TABLE world (
       id SERIAL PRIMARY KEY,
       display_name VARCHAR(255),
       created_on TIMESTAMP,
       updated_on TIMESTAMP,
       starting_area INTEGER REFERENCES area(id)
);

-- Down

DROP TABLE world;
DROP INDEX pathway_direction_idx;
DROP TABLE pathway;
DROP TABLE area;
DROP TABLE game_character;
DROP TABLE game;
DROP TYPE game_state;
DROP TABLE service_user;
