-- SELECT Statement and thier Examples

SELECT * FROM actor;
SELECT first_name,last_name FROM actor;
SELECT * from city;
SELECT country_id,city FROM city;


-- SELECT Statement Challenge --
SELECT * FROM customer;

SELECT first_name,last_name,email FROM customer


-- SELECT DISTINCT Examples 

SELECT * FROM film;
SELECT DISTINCT(release_year) FROM film;
SELECT DISTINCT rental_rate,release_year FROM film;

-- SELECT DISTINCT Challenge --

SELECT * FROM film;
SELECT DISTINCT(rating) FROM film;

-- SELECT COUNT Examples 
SELECT * FROM payment;
SELECT COUNT(*) FROM payment;
SELECT DISTINCT(amount) FROM payment;
SELECT COUNT(DISTINCT(amount)) FROM payment;

-- SELECT WHERE --
SELECT * FROM customer LIMIT 1;

SELECT * FROM customer 
WHERE first_name ='Jared';

SELECT * FROM film;

SELECT title,rental_rate,replacement_cost,rating FROM film 
WHERE rental_rate > 4 
AND replacement_cost >= 19.99
AND rating = 'R'

SELECT COUNT(*) FROM film 
WHERE rental_rate > 4 
AND replacement_cost >= 19.99
AND rating = 'R';

SELECT title,rating FROM film
where rating = 'R' OR rating = 'PG-13';

SELECT title,rating FROM film
where rating != 'R' ;

-- SELECT WHERE Challenge --

SELECT first_name,last_name,email from customer
WHERE first_name = 'Nancy' 
AND last_name = 'Thomas';

SELECT title,description FROM film
WHERE title = 'Outlaw Hanky';

SELECT * FROM address;

SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

-- SELECT ORDER BY --

SELECT first_name,last_name FROM customer
ORDER BY first_name ASC; 

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id DESC, first_name ASC;

-- SELECT LIMIT --

SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 10;   -- Top 10 most recent payment

-- SELECT ORDER BY Challenge --

SELECT customer_id,payment_date FROM payment
ORDER BY payment_date ASC
LIMIT 10; -- What are the customer_id of the first 10 payment creater ?

SELECT title,length FROM film
ORDER BY length ASC
LIMIT 5; -- What are the title of the 5 shortest movies ?

SELECT COUNT(*) FROM film
WHERE length <= 50;


-- BETWEEN Operator --

SELECT * FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT COUNT(*) FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT * FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 AND 9; 

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15'

-- IN Operator -- 

SELECT * FROM payment
WHERE amount IN (0.99,1.99,4.99)
ORDER BY amount ASC;

SELECT COUNT(*) FROM payment
WHERE amount IN (0.99,1.99,4.99);

SELECT * FROM customer
WHERE first_name IN ('John','Jake','Julie');

SELECT * FROM customer
WHERE first_name NOT IN ('John','Jake','Julie');

-- LIKE & ILIKE Operator -- 

SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%'; -- Count -> 5

SELECT * FROM customer
WHERE first_name LIKE 'j%' AND last_name LIKE 's%'; -- Count -> 0

SELECT * FROM customer
WHERE first_name ILIKE 'J%' AND last_name ILIKE 's%'; -- Count -> 5 ( ILIKE is case-insensitive)

SELECT * FROM customer
WHERE first_name LIKE '%er%' 

SELECT * FROM customer
WHERE first_name LIKE '_her%'

SELECT * FROM customer
WHERE first_name NOT LIKE '_her%'

SELECT * FROM customer
WHERE first_name LIKE 'A%' and last_name NOT LIKE 'B%'
ORDER BY last_name;



---------IMPORTANT ------
SELECT DISTINCT * FROM payment
WHERE MOD(payment_id,2)=0
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;