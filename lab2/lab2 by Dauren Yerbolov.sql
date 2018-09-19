CREATE DATABASE lab2;

CREATE TABLE countries (
  country_id SERIAL,
  country_name VARCHAR(50),
  region_id INT,
  population INT,
  CONSTRAINT pKey PRIMARY KEY (country_id)
);

INSERT INTO countries VALUES (DEFAULT, 'Russia', 01, 120000);

INSERT INTO countries (country_id, country_name) VALUES (DEFAULT, 'Georgia');

INSERT INTO countries VALUES (DEFAULT, 'Turkey', NULL, 20000);

INSERT INTO countries (country_id, country_name, region_id, population) VALUES (DEFAULT, 'Kyrgyzstan', 23, 31000),
                                                                               (DEFAULT, 'Uzbekistan', 15, 350000),
                                                                               (DEFAULT, 'China', 2, 120000);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries VALUES (DEFAULT, DEFAULT, 07, 170000);

INSERT INTO countries VALUES (DEFAULT);

CREATE TABLE countries_new (
  LIKE countries
);

INSERT INTO countries_new SELECT * FROM countries RETURNING *;

UPDATE countries SET region_id = 1 WHERE region_id IS NULL;

UPDATE countries SET population = population * 1.1 RETURNING country_name, population as "New Population";

DELETE FROM countries WHERE population < 100000;

DELETE FROM countries_new AS n USING countries AS c WHERE n.country_id = c.country_id RETURNING *;

DELETE FROM countries RETURNING *;



SELECT * FROM countries;
