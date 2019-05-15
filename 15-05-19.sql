-- 1 

SELECT f.title, inventory.inventory_id, store_id FROM film f 
	LEFT JOIN inventory USING(film_id)
	WHERE inventory.film_id IS NULL;

-- 2

SELECT f.title, inventory.inventory_id, rental_id FROM film f 
	INNER JOIN inventory USING(film_id)
	LEFT JOIN rental USING (inventory_id)
	WHERE rental_id IS NULL;
	
-- 3

SELECT  c.last_name, c.first_name, i.store_id, f.title  FROM customer c
	INNER JOIN rental USING (customer_id)
	INNER JOIN inventory i USING (inventory_id)
	INNER JOIN film f USING (film_id)
	WHERE rental_date IS NOT NULL 
	AND	return_date IS NOT NULL
	ORDER BY store_id, c.last_name;

-- 4

SELECT store.store_id, CONCAT_WS(" ", city.city, country.country) AS "City | Country", CONCAT_WS(" ", staff.first_name, staff.last_name) AS "Manager", sum(payment.amount) AS "total Sales" FROM store 
	INNER JOIN staff on manager_staff_id = staff_id
	INNER JOIN inventory on store.store_id = inventory.store_id
	INNER JOIN rental USING (inventory_id)
	INNER JOIN payment USING (rental_id)
	INNER JOIN address on address.address_id =  store.address_id
	INNER JOIN city USING (city_id)
	INNER JOIN country USING (country_id)
	GROUP BY store.store_id;
	
-- 5

SELECT a.first_name, a.last_name, count(film_actor.film_id) AS "totalFilms" FROM actor a
	INNER JOIN film_actor USING (actor_id)
	GROUP BY a.actor_id
	HAVING totalFilms >= ALL (SELECT count(film_id) FROM film_actor GROUP BY actor_id);

