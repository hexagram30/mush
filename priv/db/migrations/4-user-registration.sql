-- Up

ALTER TABLE service_user ADD COLUMN registration_id UUID;


--Down

ALTER TABLE service_user DROP COLUMN registration_id;
