-- 1

SELECT title, special_features FROM film WHERE rating = 'PG-13';

-- 2

SELECT DISTINCT(title), film.`length` FROM film;

-- 3

SELECT film.title, film.rental_rate, film.replacement_cost FROM film WHERE film.replacement_cost BETWEEN 20.00 AND 24.00;

-- 4

SELECT film.title, category.name from film inner join film_category USING (film_id) inner join category using (category_id) WHERE special_features LIKE '%Behind the scenes%';

-- 5

SELECT actor.first_name, actor.last_name FROM actor INNER JOIN film_actor USING (actor_id) INNER JOIN film USING (film_id) WHERE film.title LIKE '%ZOOLANDER FICTION%';

-- 6

SELECT address.address, city.city, country.country FROM address INNER JOIN city USING (city_id) INNER JOIN country USING (country_id) INNER JOIN store USING (address_id) WHERE store.store_id = 1;

-- 7 (CORREGIR)

SELECT f1.title, f2.title, f1.rating FROM film f1, film f2 WHERE f1.rating = f2.rating AND f1.film_id <> f2.film_id;

-- 8

SELECT DISTINCT(title), staff.first_name FROM staff, film INNER JOIN inventory USING (film_id) INNER JOIN store USING (store_id) WHERE store.manager_staff_id = staff.staff_id AND store.store_id = 2;
