-- 1. What are the emails of customer who lives in california ?
SELECT * FROM customer;
SELECT * FROM address;

SELECT district,email FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'California'

-- 2. Get a list of all the movies "Nick wahlberg" has been in.

SELECT * FROM film; --film_id
SELECT * FROM actor; --actor_id
SELECT * FROM film_actor; -- (Both film_id & actor_id)

SELECT title,first_name,last_name FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name ='Nick' AND actor.last_name ='Wahlberg'

SELECT title,first_name,last_name from film_actor
INNER JOIN actor ON film_actor.actor_id = actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE actor.first_name ='Nick' AND actor.last_name ='Wahlberg'

