-- 1
SELECT first_name, last_name	 FROM actor a1 WHERE EXISTS 
(SELECT a2.* FROM actor a2 WHERE a1.last_name = a2.last_name and a1.actor_id <> a2.actor_id) ORDER BY first_name;
-- 2              
SELECT first_name,last_name 
  FROM actor a1 WHERE a1.actor_id NOT IN (SELECT actor_id FROM film_actor);
-- 3
SELECT c1.customer_id, c1.first_name, c1.last_name FROM customer c1 
WHERE (SELECT count(r1.customer_id) FROM rental r1 GROUP BY customer_id HAVING COUNT(r1.customer_id) =1);
-- 4
SELECT c1.customer_id, c1.first_name, c1.last_name FROM customer c1 
WHERE (SELECT count(r1.customer_id) FROM rental r1 HAVING COUNT(r1.customer_id) >1);
-- 5
SELECT a1.first_name, a1.last_name FROM actor a1 WHERE a1.actor_id IN 
(SELECT fa.actor_id FROM film_actor fa INNER JOIN film f USING (film_id) 
WHERE f.title LIKE "%betrayed rear%" OR f.title LIKE "%catch amistad%");
-- 6
SELECT a1.first_name, a1.last_name FROM actor a1 WHERE a1.actor_id IN 
(SELECT fa.actor_id FROM film_actor fa INNER JOIN film f USING (film_id) 
WHERE f.title LIKE "%betrayed rear%");
-- 7
SELECT a1.actor_id, a1.first_name, a1.last_name FROM actor a1 WHERE a1.actor_id IN 
(SELECT fa.actor_id FROM film_actor fa INNER JOIN film f USING (film_id) 
WHERE f.title LIKE "%betrayed rear%") 
AND a1.actor_id IN (SELECT fa.actor_id FROM film_actor fa INNER JOIN film f USING (film_id) 
WHERE f.title LIKE "%catch amistad%");
-- 8
SELECT a1.actor_id, a1.first_name, a1.last_name FROM actor a1 WHERE a1.actor_id NOT IN 
(SELECT fa.actor_id FROM film_actor fa INNER JOIN film f USING (film_id) 
WHERE f.title LIKE "%betrayed rear%" OR f.title LIKE "%catch amistad%");







