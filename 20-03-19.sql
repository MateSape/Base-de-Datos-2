CREATE DATABASE IF NOT EXISTS imdb

USE imdb

CREATE TABLE film(
film_id int NOT NULL AUTO_INCREMENT,
title varchar(250),
description varchar(250),
release_year YEAR,
CONSTRAINT film_pk PRIMARY KEY (film_id)
)

CREATE TABLE actor(
actor_id int NOT NULL AUTO_INCREMENT,
first_name varchar(50),
last_name varchar(100) NOT NULL,
CONSTRAINT actor_pk PRIMARY KEY (actor_id)
)

CREATE TABLE film_actor (
actor_id int NOT NULL,
film_id INT NOT NULL
)

ALTER TABLE film ADD last_update DATETIME;
ALTER TABLE actor ADD last_update DATETIME;

ALTER TABLE film_actor ADD CONSTRAINT fk_actor FOREIGN KEY (actor_id) REFERENCES actor(actor_id);

ALTER TABLE film_actor ADD 
CONSTRAINT fk_film FOREIGN KEY (film_id) REFERENCES film(film_id);

INSERT INTO film (title, description, release_year)
VALUES ("Harry Potter 1", "Harry potter y la piedra filosofal", 2006);

INSERT INTO film (title, description, release_year)
VALUES ("Matrix", "The best movie ever", 1998);

INSERT INTO actor (first_name, last_name)
VALUES ("Neo", "The One");

INSERT INTO actor (first_name, last_name)
VALUES ("Danniel", "Raddcliffe");

INSERT INTO film_actor (actor_id, film_id)
VALUES (2, 2);

SELECT * FROM film;
