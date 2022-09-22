SHOW ALL

SHOW TIMEZONE -- "Asia/Calcutta"

SELECT CURRENT_TIME -- "16:13:34.941090+05:30"

SELECT CURRENT_DATE -- "2022-09-17"

SELECT NOW() -- "2022-09-17 16:12:43.40137+05:30"

SELECT TIMEOFDAY() -- "Sat Sep 17 16:17:36.320393 2022 IST"

-----------------Timestamps and Extract  --------------------------------------------

SELECT * FROM payment;

SELECT EXTRACT(YEAR FROM payment_date) AS year_payment
FROM payment;


SELECT EXTRACT(MONTH FROM payment_date) AS month_payment
FROM payment;


SELECT EXTRACT(QUARTER FROM payment_date) AS QUARTER_payment
FROM payment;


SELECT AGE(payment_date) FROM payment;

SELECT TO_CHAR(payment_date,'MM-DD-YYYY') FROM payment; --"02-15-2007"

SELECT TO_CHAR(payment_date,'DD/MM/YYYY') FROM payment; --"15/02/2007"

SELECT TO_CHAR(payment_date,'mon/yyyy') FROM payment; --"feb/2007"

SELECT TO_CHAR(payment_date,'MONTH-YY') FROM payment; --"FEBRUARY -07"

--Timestamps and Extract - Challenge Tasks --

--1. During which months did payments occur (Format your answer to return back the full month name)?

SELECT DISTINCT(TO_CHAR(payment_date,'MONTH')) FROM payment;

--2. How many payments occurs in monday ?

SELECT COUNT(EXTRACT(dow FROM payment_date)) as payment_day FROM payment 
WHERE EXTRACT(dow FROM payment_date) = 1 --2948


SELECT COUNT(*) FROM payment 
WHERE EXTRACT(dow FROM payment_date) = 1 --2948

----------Mathematical Functions and Operators------------------

SELECT * from film;
SELECT ROUND(rental_rate/replacement_cost,2) * 100 as cost_in_percentage FROM film;
SELECT 0.1*replacement_cost FROM film;
SELECT ROUND(replacement_cost*10/100,2) FROM film;


--------String Functions and Operators---------------
-- https://www.postgresql.org/docs/current/functions-string.html

SELECT first_name,LENGTH(first_name) FROM customer;

SELECT first_name || ' ' || last_name FROM customer;

SELECT first_name || ' ' || last_name AS full_name FROM customer;

SELECT LOWER(first_name) || LOWER(last_name) || '@gamil.com' AS custom_email FROM customer;

SELECT LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@gamil.com' AS custom_email FROM customer;

------------- SubQuery -----------------------

SELECT * FROM film;

SELECT title,rental_rate FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film)


SELECT * from rental
SELECT * from inventory

SELECT film_id,title FROM film
WHERE film_id IN (
SELECT inventory.film_id FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30'
)
ORDER BY film_id;


SELECT first_name,last_name FROM customer AS c
WHERE EXISTS (
	SELECT * FROM payment AS p 
	WHERE p.customer_id = c.customer_id
	AND p.amount > 11
) 

SELECT first_name,last_name FROM customer AS c
WHERE NOT EXISTS (
	SELECT * FROM payment AS p 
	WHERE p.customer_id = c.customer_id
	AND p.amount > 11
)


------------- Self-Join -----------------------

SELECT title,length FROM film WHERE length = 117

SELECT f1.title,f2.title,f1.length
FROM film f1
JOIN film f2 ON f1.film_id != f2.film_id
AND f1.length = f2.length

SELECT f1.title,f2.title,f1.length
FROM film f1
JOIN film f2 ON f1.film_id > f2.film_id
AND f1.length = f2.length
AND f1.length = 117

SELECT f1.title,f2.title,f1.length
FROM film f1, film f2
WHERE f1.film_id != f2.film_id
AND f1.length = f2.length



