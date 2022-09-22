-- As statements

SELECT customer_id,amount 
from payment;

SELECT customer_id, SUM(amount)
from payment
GROUP BY customer_id;

SELECT customer_id, SUM(amount) AS total_spend
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT customer_id, amount as total_spend
FROM payment
WHERE amount > 2;

--- Inner Joins ---
--An inner joins will result with the set of records thats match in both tables.

SELECT payment.customer_id,first_name,email
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id


SELECT payment.customer_id,first_name,email,SUM(payment.amount)
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id,first_name,email
ORDER BY payment.customer_id ASC;


--- FULL Outer Joins --- produces the set of all records in Table A and Table B, with matching records from both sides where available. If there is no match, the missing side will contain null.
-- FULL Outer Joins with WHERE [Get rows unique to either table (rows not found in both tables)]
SELECT COUNT(DISTINCT customer_id) FROM customer
SELECT COUNT(DISTINCT customer_id) FROM payment


SELECT *
FROM payment
FULL OUTER JOIN customer
ON payment.customer_id = customer.customer_id;


SELECT *
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.customer_id IS null; -- Unique result (records will not matche to either tables)


--- LEFT Outer Joins ---
--- LEFT OUTER JOIN with WHERE (Get rows unique to left tables)


SELECT film.film_id,title,inventory_id,store_id
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id


SELECT film.film_id,title,inventory_id,store_id
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id
WHERE title = 'Academy Dinosaur' 


SELECT film.film_id,title,inventory_id,store_id
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NOT NULL;


SELECT film.film_id,title,inventory_id,store_id
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL;


--- RIGHT Outer Joins ---

SELECT film.film_id,title,inventory_id,store_id
FROM film
RIGHT OUTER JOIN inventory
ON film.film_id = inventory.film_id


SELECT film.film_id,title,inventory_id,store_id
FROM film
RIGHT JOIN inventory
ON film.film_id = inventory.film_id
WHERE title = 'Academy Dinosaur' 


SELECT film.film_id,title,inventory_id,store_id
FROM film
RIGHT JOIN inventory
ON film.film_id = inventory.film_id
WHERE film.film_id IS NOT NULL;


SELECT film.film_id,title,inventory_id,store_id
FROM film
RIGHT JOIN inventory
ON film.film_id = inventory.film_id
WHERE film.film_id IS NULL;


--- UNION Joins ---


SELECT film_id FROM film
UNION 
SELECT film_id FROM inventory


