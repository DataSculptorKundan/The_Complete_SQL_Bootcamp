-- Aggregation Functions

SELECT * FROM film;
SELECT MIN(replacement_cost) FROM film;
SELECT MAX(replacement_cost) FROM film;
SELECT AVG(replacement_cost) FROM film;
SELECT ROUND(AVG(replacement_cost),4) FROM film;
SELECT SUM(replacement_cost) FROM film;
SELECT MIN(replacement_cost),MAX(replacement_cost),AVG(replacement_cost),ROUND(AVG(replacement_cost),4),SUM(replacement_cost) FROM film;

SELECT SUM(replacement_cost),film_id FROM film; -- ERROR:  column "film.film_id" must appear in the GROUP BY clause or be used in an aggregate function
-------

SELECT * FROM payment;

SELECT customer_id FROM payment
GROUP BY customer_id
ORDER BY customer_id;

SELECT customer_id,staff_id,SUM(amount) FROM payment
GROUP BY customer_id,staff_id
ORDER BY customer_id;

SELECT customer_id,SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC

-- GROUP BY Challenges

SELECT * FROM payment;

SELECT staff_id,COUNT(payment_id) FROM payment
GROUP BY staff_id
ORDER BY COUNT(payment_id) DESC
LIMIT 1;


SELECT * FROM film;

SELECT rating,ROUND(AVG(replacement_cost),2) FROM film
GROUP BY rating
ORDER BY rating;


SELECT customer_id,SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

-- HAVING Clause --

SELECT * FROM payment;

SELECT customer_id,SUM(amount) FROM payment
WHERE customer_id NOT IN (148,144,137)
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY SUM(amount);

SELECT * FROM customer;

SELECT store_id,COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

-- HAVING Challenges Task --

SELECT * FROM payment;

SELECT customer_id,COUNT(payment_id) 
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) >= 40;

SELECT customer_id,SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 100;
