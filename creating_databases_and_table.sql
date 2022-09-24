---------- CREATE Table -----------

CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
	)

CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(100) UNIQUE NOT NULL
	)

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
	)
	
	
---------- INSERT -----------

INSERT INTO account(username,password,email,created_on)
VALUES('Jose','password','jose@mail.com',CURRENT_TIMESTAMP)
SELECT * FROM account


INSERT INTO job(job_name) VALUES ('Astronaut')
SELECT * FROM job
INSERT INTO job(job_name) VALUES ('President')

INSERT INTO account_job(user_id,job_id,hire_date) VALUES (1,1,CURRENT_TIMESTAMP)
SELECT * FROM account_job


---------- UPDATE -----------

SELECT * FROM account
SELECT * FROM account_job

UPDATE account
SET last_login = CURRENT_TIMESTAMP

UPDATE account
SET created_on = last_login

UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id -- Update Joins

UPDATE account 
SET last_login = CURRENT_TIMESTAMP
RETURNING last_login --  To get the result 


---------- DELETE -----------

INSERT INTO job(job_name) VALUES ('Cowboy');

SELECT * FROM job;

DELETE FROM job
WHERE job_name = 'Cowboy'
RETURNING job_id,job_name;


---------- ALTER Table -----------

CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(200) NOT NULL,
	person VARCHAR(200) NOT NULL UNIQUE
	)

SELECT * FROM new_information;

ALTER TABLE information RENAME TO new_information;
ALTER TABLE new_information RENAME COLUMN person TO people;


ALTER TABLE new_information ALTER COLUMN people DROP NOT NULL;
ALTER TABLE new_information ALTER COLUMN people SET NOT NULL;

---------- DROP Table -----------

ALTER TABLE new_information
DROP COLUMN people;

ALTER TABLE new_information
DROP COLUMN IF EXISTS people;

---------- CHECK Constraints -----------

CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK(birthdate > '1900-01-01'),
	hire_date DATE CHECK (hire_date > birthdate),
	salary INTEGER CHECK (salary > 0)
)

INSERT INTO employees(first_name,last_name,birthdate,hire_date,salary) 
VALUES ('Jose','Portilla','1999-07-11','2010-01-01',100)

INSERT INTO employees(first_name,last_name,birthdate,hire_date,salary) 
VALUES ('Ravi','Portilla','1989-07-11','2010-01-01',300)

SELECT * FROM employees
