CREATE DATABASE lab1;

CREATE TABLE users (
  id serial,
  firstname varchar(50) NOT NULL,
  lastname  varchar(50) NOT NULL
);

select * from users;

ALTER TABLE users ADD COLUMN isadmin integer CONSTRAINT checker CHECK (isadmin >= 0 AND isadmin <= 1);

ALTER TABLE users DROP CONSTRAINT IF EXISTS checker;

ALTER TABLE users ALTER COLUMN isadmin TYPE BOOLEAN USING CASE WHEN isadmin=0 THEN FALSE ELSE TRUE END;

ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users ADD CONSTRAINT constraint_primaryKey PRIMARY KEY (id);

INSERT INTO users (firstname, lastname, isadmin) VALUES ('Dauren', 'Yerbolov', TRUE);
INSERT INTO users (firstname, lastname, isadmin) VALUES ('Askar', 'Mussayev', TRUE);


CREATE TABLE tasks (
  id serial,
  name varchar(50) NOT NULL,
  user_id integer
);

DROP TABLE tasks;

DROP DATABASE lab1;



