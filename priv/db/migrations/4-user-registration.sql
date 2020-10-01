-- Up

CREATE TYPE reg_state AS ENUM (
       'initiated',
       'incomplete',
       'complete'
);

ALTER TABLE service_user ADD COLUMN registration_id UUID UNIQUE;
ALTER TABLE service_user ADD COLUMN confirmation_code VARCHAR(9);
ALTER TABLE service_user ADD COLUMN registration_status reg_state;

UPDATE service_user SET registration_status = 'complete'
       WHERE email = 'root@hxgm30.mush';
UPDATE service_user SET confirmed = TRUE WHERE email = 'root@hxgm30.mush';

CREATE FUNCTION expire_nonconfirmed_users() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM service_user
  WHERE created_on < NOW() - INTERVAL '24 hours'
  AND registration_status != 'complete';
  RETURN NEW;
END;
$$;

CREATE TRIGGER expire_nonconfirmed_users_trigger
    AFTER INSERT ON service_user
    EXECUTE PROCEDURE expire_nonconfirmed_users();

--Down

DROP TRIGGER expire_nonconfirmed_users_trigger ON service_user;

DROP FUNCTION expire_nonconfirmed_users;

ALTER TABLE service_user DROP COLUMN registration_status;
ALTER TABLE service_user DROP COLUMN confirmation_code;
ALTER TABLE service_user DROP COLUMN registration_id;
