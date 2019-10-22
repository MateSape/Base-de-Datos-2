-- 1
INSERT INTO customer (store_id, first_name, last_name, email, address_id, active) VALUES
	(1, "Mateo", "Cetti", "mateocetti2000@gmail.com", (SELECT max(address_id) FROM address
	INNER JOIN city USING (city_id)
	INNER JOIN country USING (country_id)
	WHERE country.country LIKE "%united states%"), 1);
-- 2
INSERT INTO rental (inventory_id, customer_id, staff_id) VALUES (25, 601, 2);

-- 3
UPDATE film SET release_year = "2001" WHERE rating LIKE "%G%";

--4
UPDATE rental SET return_date = CURDATE() WHERE rental_id = 11496;

-- 5
-- SQL Error [1451] [23000]: Cannot delete or update a parent row: a foreign key constraint fails 
-- (`sakila`.`film_actor`, CONSTRAINT `fk_film_actor_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON UPDATE CASCADE)

DELETE from film_actor WHERE film_id = 1

DELETE FROM film_category WHERE film_id = 1;

DELETE FROM inventory WHERE film_id = 1;

DELETE FROM rental WHERE inventory_id IN (SELECT inventory_id FROM inventory WHERE film_id = 1);

DELETE FROM film WHERE film_id = 1;

--6
INSERT INTO rental (inventory_id, customer_id, staff_id) VALUES (30, 601, 2);

INSERT INTO payment (customer_id, staff_id, rental_id, amount) VALUES (601, 2, 16051, 300);
