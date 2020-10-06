-- Up

TRUNCATE game, area, pathway, game_character, world RESTART IDENTITY;
ALTER TABLE game DROP COLUMN play_type;
ALTER TABLE game ADD COLUMN tagline VARCHAR(255);
ALTER TABLE game ADD COLUMN banner_file VARCHAR(255);

-- Down

ALTER TABLE game ADD COLUMN play_type VARCHAR(255);
ALTER TABLE game DROP COLUMN tagline;
ALTER TABLE game DROP COLUMN banner_file;
