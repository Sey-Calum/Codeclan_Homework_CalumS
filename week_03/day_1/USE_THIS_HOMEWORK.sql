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
SELECT 
	COUNT(id) AS employees_from_portugal
FROM employees 
GROUP BY country = 'Portugal'


--4. Count the number of employees based in either Portugal or Spain. --
SELECT
	COUNT(id) AS employees_from_poland_or_spain
FROM employees 
WHERE country IN 'Portugal', 'SPAIN'

--5.Count the number of pay_details records lacking a local_account_no. --

SELECT
	COUNT(pay_details) AS local_account_no
FROM employees 
WHERE local_account_no IS NULL

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
	COUNT(id) as first_names_starting_with_F
From employees 
WHERE first_name ILIKE 'F%;'


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
  COUNT(id) AS number_employees_start_2003
FROM employees
WHERE start_date BETWEEN '2003-01-01' AND '2003-12-31'
GROUP BY department

--10. Obtain a table showing department, fte_hours and the--
--number of employees in each department who work each--
--fte_hours pattern. Order the table alphabetically by department,--
--and then in ascending order of fte_hours--

SELECT department, fte_hours, COUNT(id)
	AS number_of_employees
FROM employees 
GROUP BY department, fte_hours
ORDER BY department ASC NULLS LAST, fte_hours ASC NULLS LAST

--11. Obtain a table showing any departments in which there are two or--
--more employees lacking a stored first name. Order the--
--table in descending order of the number of employees--
--lacking a first name, and then in alphabetical order by department.--	



--12 Find the proportion of employees in each department who are grade 1.--
	
SELECT
	grade,
	department,
	SUM
FROM employees 
WHERE