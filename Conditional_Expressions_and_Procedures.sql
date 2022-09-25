SELECT * FROM customer;

SELECT customer_id,
	CASE
		WHEN (customer_id <= 100) THEN 'Premium Customer'
		WHEN (customer_id BETWEEN 100 and 200) THEN 'Plus Customer'
		ELSE 'Normal Customer' 
	END AS Customer_Class
FROM customer;

-- CASE EXPRESSION -- 

SELECT customer_id,
	CASE customer_id
		WHEN 2 THEN 'Second Place'
		WHEN 5 THEN 'Fifth Place'
		ELSE 'Consolidation'
	END AS raffle_results
FROM customer;

SELECT * FROM film;

SELECT 
	SUM(CASE rental_rate WHEN 0.99 THEN 1 ELSE 0 END) AS bargains,
	SUM(CASE rental_rate WHEN 2.99 THEN 1 ELSE 0 END) AS Regular,
	SUM(CASE rental_rate WHEN 4.99 THEN 1 ELSE 0 END) AS Premium
FROM film;

--- Challenge Task ---

-- we want to know and compare the various amounts of film, we have per movie rating.

SELECT 
	SUM(CASE rating WHEN 'R' THEN 1 ELSE 0 END) AS r,
	SUM(CASE rating WHEN 'PG' THEN 1 ELSE 0 END) AS pg,
	SUM(CASE rating WHEN 'PG-13' THEN 1 ELSE 0 END) AS pg13
FROM film;


---------- COALESCE ----------

SELECT * FROM payment;

CREATE TABLE payment(
	payment_id INTEGER PRIMARY KEY,
	amount INTEGER NOT NULL,
	discount INTEGER);
	
INSERT INTO payment(payment_id,amount,discount) VALUES (1,100.00,25);
INSERT INTO payment(payment_id,amount,discount) VALUES (2,308.00,27);
INSERT INTO payment(payment_id,amount) VALUES (3,999.00);

SELECT payment_id,(amount-COALESCE(discount,0)) as "Total Amount" FROM payment;

---------- CAST Function ----------

SELECT CAST('5' AS INTEGER) AS new_int;
SELECT '5'::INTEGER AS new_int;

SELECT '5'::VARCHAR(2) AS new_varchar;

SELECT * FROM rental;

SELECT CHAR_LENGTH(inventory_id) FROM rental;
SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental;


---------- NULLIF Function ----------

CREATE TABLE depts(
	first_name VARCHAR(20),
	department VARCHAR(1));
	
INSERT INTO depts(first_name,department) VALUES ('Kundan','A')
INSERT INTO depts(first_name,department) VALUES ('Rahul','A'),('Shyam','A'),('Sita','B'),('Radha','B');

SELECT * FROM depts;

SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
) AS department_ratio
FROM depts; -- 1

DELETE FROM depts
WHERE department = 'B'

SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END),0)
) AS department_ratio
FROM depts; -- 1


---------- VIEWS ----------

CREATE VIEW customer_info AS
SELECT first_name,last_name, address FROM customer
INNER JOIN address ON customer.address_id = address.address_id

SELECT * FROM customer_info;

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name,last_name, address,district FROM customer
INNER JOIN address ON customer.address_id = address.address_id

SELECT * FROM customer_info;

DROP VIEW IF EXISTS customer_info;
ALTER VIEW customer_info RENAME to c_info; 