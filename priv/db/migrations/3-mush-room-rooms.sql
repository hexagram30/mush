-- Up

ALTER TABLE area ADD COLUMN creator INTEGER REFERENCES game_character(id);
ALTER TABLE area ADD COLUMN owner INTEGER REFERENCES game_character(id);

ALTER TABLE pathway ADD COLUMN creator INTEGER REFERENCES game_character(id);
ALTER TABLE pathway ADD COLUMN owner INTEGER REFERENCES game_character(id);

ALTER TABLE game_character ADD COLUMN current_home INTEGER REFERENCES area(id);
ALTER TABLE game_character ADD COLUMN built_home BOOLEAN;

ALTER TABLE service_user ADD COLUMN confirmed BOOLEAN;

INSERT INTO area (id, display_name, created_on, description)
       VALUES (2, 'The center of the room', current_timestamp, 'You are standing in the center of the large MUSH Room. Given the low light, you cannot see to the edges of the room and can really only see clearly your immediage vicinity. There is a wide column here that seems to rise to the ceiling. There is a door in the column.');

INSERT INTO pathway (id, created_on, from_area_id, to_area_id, direction)
       VALUES (1, current_timestamp, 1, 2, 'inwards');
INSERT INTO pathway (id, created_on, from_area_id, to_area_id, direction)
       VALUES (2, current_timestamp, 2, 1, 'outwards');

INSERT INTO area (id, display_name, created_on, description)
       VALUES (3, 'Stairway', current_timestamp, 'You are standing in an enclosed spiaral staircase. It is not light enough in here to see how far the staircase goes.');

INSERT INTO pathway (id, created_on, from_area_id, to_area_id, direction)
       VALUES (3, current_timestamp, 2, 3, 'enter');
INSERT INTO pathway (id, created_on, from_area_id, to_area_id, direction)
       VALUES (4, current_timestamp, 3, 2, 'leave');

INSERT INTO area (id, display_name, created_on, description)
       VALUES (4, 'Cupola', current_timestamp, 'Climbing the stairs seems to take longer than you expected, but once there you find yourself in a quiet, enclosed, and completely extraordinary space: the curved walls are entirely transparent, and beyond them unfolds a darkness populated with an endless array of moving constellations.');

INSERT INTO pathway (id, created_on, from_area_id, to_area_id, direction)
       VALUES (5, current_timestamp, 3, 4, 'up');
INSERT INTO pathway (id, created_on, from_area_id, to_area_id, direction)
       VALUES (6, current_timestamp, 4, 3, 'down');

-- Down

TRUNCATE TABLE pathway RESTART IDENTITY CASCADE;
DELETE FROM area WHERE id > 1;

ALTER TABLE service_user DROP COLUMN confirmed;

ALTER TABLE game_character DROP COLUMN built_home;
ALTER TABLE game_character DROP COLUMN current_home;

ALTER TABLE pathway DROP COLUMN owner;
ALTER TABLE pathway DROP COLUMN creator;

ALTER TABLE area DROP COLUMN owner;
ALTER TABLE area DROP COLUMN creator;
