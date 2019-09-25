# Trabaje con Gabriel Dal Bo porque a mi computadora se le quemo la mother
#SQL_NO_CACHE: Carga con el tiempo real de la query
SELECT SQL_NO_CACHE amount FROM payment;

SELECT postal_code FROM address;

SELECT SQL_NO_CACHE postal_code FROM address INNER JOIN city c
USING (city_id) INNER JOIN country co USING (country_id)
WHERE postal_code LIKE '35200' or postal_code LIKE '83579' or postal_code LIKE '53561'
or postal_code LIKE '17886';
#0.00101925

CREATE INDEX postalCode ON address(postal_code);

SELECT SQL_NO_CACHE postal_code FROM address INNER JOIN city c
USING (city_id) INNER JOIN country co USING (country_id)
WHERE postal_code LIKE '35200' or postal_code LIKE '83579' or postal_code LIKE '53561'
or postal_code LIKE '17886';
#0.00043275

DROP INDEX postalCode ON address;

SELECT c.city FROM city c;

#2)

SELECT a.last_name FROM actor a;
#0.02108550

SELECT a.first_name FROM actor a;
# 0.00035775

#El last_name tarda mas porque tiene una key Mul,
#esto quiere decir que la columna es parte de un index

#3

SELECT f.description FROM film f
WHERE f.description LIKE "%epic drama%";

#0.00232925

SELECT description FROM film_text WHERE
MATCH(title, description) AGAINST("epic drama");
#0.00263475


#Cuando se inserta una pelicula en la tabla film,
# Se activa un trigger que guarda entre otras cosas
# la descripcion de la pelicula como FULLTEXT (junto con el titulo de la pelicula)
# a la tabla film_text
# En el primer tarda menos porque solo busca
#las descripciones que tienen epic drama
# En cambio en film_text tarda mas porque
#busca todas las descripciones que incluyan
#la palabra epic o drama
