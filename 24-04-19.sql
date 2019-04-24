-- 1

SELECT country.country, COUNT(*) 
	FROM city INNER JOIN country USING (country_id) 
	GROUP BY city.country_id 
	ORDER BY country.country, country.country_id

-- 2
	
SELECT country.country, COUNT(*) 
	FROM city INNER JOIN country USING (country_id) 
	GROUP BY city.country_id HAVING count(*) > 10 
	ORDER BY count(*) DESC
	
-- 3
	
SELECT c.customer_id, c.last_name, c.first_name, 
	(SELECT count(*) FROM rental r1 WHERE r1.customer_id = c.customer_id) AS "Total Films",
	(SELECT SUM(amount)FROM payment p1 WHERE p1.customer_id = c.customer_id
	GROUP BY customer_id) AS "TotalMoney" 
	FROM customer c ORDER BY TotalMoney DESC
	
-- 4
	
SELECT category.name, AVG(film.`length`) AS "average"
	FROM film INNER JOIN film_category 
	USING (film_id) INNER JOIN category 
	USING (category_id) GROUP BY category.category_id
	HAVING AVG(`length`) > (SELECT AVG(`length`) FROM film)
	ORDER BY AVG(film.`length`) DESC
	
-- 5
	
SELECT film.rating, SUM(payment.amount) AS "sales" FROM film 
	INNER JOIN inventory USING (film_id) 
	INNER JOIN rental USING (inventory_id)
	INNER JOIN payment USING (rental_id)
	GROUP BY film.rating
	ORDER BY sales DESC
	
	
