SELECT *
FROM employees 


--1. Find all the employees who work in the ‘Human Resources’ department. --
SELECT *
FROM employees 
WHERE department = 'Human Resources';

--2. Get the first_name, last_name, --
--and country of the employees who work in the ‘Legal’ department. -- 
SELECT
	first_name,
	last_name,
	country 
FROM employees 
WHERE department = 'Legal';


--3. Count the number of employees based in Portugal. --
SELECT *
	COUNT(country) AS employees_from_poland
FROM employees 
GROUP BY country 


--4. Count the number of employees based in either Portugal or Spain. --
SELECT
	COUNT(country) AS employees_from_poland_or_spain
FROM employees 
GROUP BY 

--5.Count the number of pay_details records lacking a local_account_no. --

SELECT
	COUNT(pay_details) AS local_account_no
FROM employees 
GROUP BY

--6. Get a table with employees first_name and last_name --
-- ordered alphabetically by last_name (put any NULLs last). --

SELECT 
	first_name,
	last_name
From employees 
ORDER BY last_name 
			ASC NULLS LAST;
		
			
--7. How many employees have a first_name beginning with ‘F’?

SELECT
	first_name
	COUNT(id) as first_names_starting_with_F
From employees 
WHERE first_name LIKE 'F%;'


--8. Count the number of pension enrolled employees--
-- not based in either France or Germany.--

SELECT
	pension_enrol,
	country,
	COUNT(id) AS based_in_France_or_Germany
FROM employees 
GROUP BY country = 'France' OR country = 'Germany'

--9. Obtain a count by department of the employees --
-- who started work with the corporation in 2003. --

SELECT
	grade,
	department,
	SUM

--12 Find the proportion of employees in each department who are grade 1.--
	
SELECT
	grade,
	department,
	SUM
FROM employees 
WHERE