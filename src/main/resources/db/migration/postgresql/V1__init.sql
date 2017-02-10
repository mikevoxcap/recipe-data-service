/* DDL initialization for the database */
CREATE TABLE recipe."User" (
  user_id serial NOT NULL, -- Unique ID of the user
  first_name varchar(100) NOT NULL, -- First name of the user
  last_name varchar(100) NOT NULL, -- Last name of the user
  date_of_birth date NOT NULL, -- Birth date of the user
  login_id varchar(100) NOT NULL, -- Login ID of the user
  password varchar(50) NOT NULL, -- Password of the user
  email_address varchar(150) NOT NULL, -- Email address of the user
  created_by varchar(100) NOT NULL, -- User created
  created_timestamp timestamp NOT NULL -- Created timestamp
);

COMMENT ON COLUMN recipe."User".user_id IS 'Unique ID of the user';
COMMENT ON COLUMN recipe."User".first_name IS 'First name of the user';
COMMENT ON COLUMN recipe."User".last_name IS 'Last name of the user';
COMMENT ON COLUMN recipe."User".date_of_birth IS 'Birth date of the user';
COMMENT ON COLUMN recipe."User".login_id IS 'Login ID of the user';
COMMENT ON COLUMN recipe."User".password IS 'Password of the user';
COMMENT ON COLUMN recipe."User".email_address IS 'Email address of the user';
COMMENT ON COLUMN recipe."User".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."User".created_timestamp IS 'Created timestamp by the user';
