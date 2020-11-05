Homework / Lab 4/11/2020

--MVP Questions

--1. Are there any pay_details records lacking both a local_account_no
-- and iban number?

SELECT *
FROM pay_details 
--WHERE local_account_no AND iban IS NULL
ORDER BY local_account_no NULLs FIRST;

-- ANSWER = NO

--2. Get a table of employees first_name, last_name and country,
-- ordered alphabetically first by country and then by last_name
-- (put any NULLs last).

SELECT 
	first_name,
	last_name,
	country
FROM employees
ORDER BY country ASC NULLS LAST, last_name ASC NULLS LAST;

--3.Find the details of the top ten highest paid employees in the corporation.

SELECT
	salary,
	first_name,
	last_name
FROM employees 
ORDER BY salary DESC NULLS LAST LIMIT 10; 



--4. Find the first_name, last_name and salary of the lowest
--  paid employee in Hungary.

SELECT
	first_name,
	last_name,
	salary,
	country 
FROM employees 
WHERE country = 'Hungary'
ORDER BY salary ASC NULLS LAST LIMIT 1;

--5. Find all the details of any employees with a ‘yahoo’ email address?

SELECT *
FROM employees 
WHERE email LIKE '%@yahoo%';

--6. Provide a breakdown of the numbers of employees enrolled, not enrolled,
--and with unknown enrollment status in the corporation pension scheme.

SELECT *
	COUNT(id) AS number_of_employees
FROM employees 
WHERE pension_enrol = TRUE
GROUP BY pension_erole;

--7.What is the maximum salary among those employees in the ‘Engineering’
-- department who work 1.0 full-time equivalent hours (fte_hours)?

SELECT
	salary,
	department,
	MAX salary AS max_salay_fte_hours
FROM employees 
WHERE fte_hours =1
GROUP BY department;


--8.Get a table of country, number of employees in that country,
-- and the average salary of employees in that country for any countries
-- in which more than 30 employees are based. Order the table by average
-- salary descending.

SELECT
	country,
	salary,
	COUNT(id) AS country_count,
	ROUND(AVG (salary), 2) AS avg_salary
FROM employees 
GROUP BY country 
HAVING country (id) > 30
ORDER BY salary ASC NULLs LAST;



--9. Return a table containing each employees first_name, last_name,
--full-time equivalent hours (fte_hours), salary, and a new column
--effective_yearly_salary which should contain fte_hours multiplied by salary.

SELECT
	first_name,
	last_name,
	fte_hours,
	salary,
	(salary) * (fte_hours) AS effective_yearly_salary
FROM employees;


--10.Find the first name and last name of all employees who
--lack a local_tax_code. 

SELECT 
	e.first_name,
	e.last_join,
	local_tax_code,
	e.pay_detail_id 
FROM employees AS e
FULL JOIN pay_details ON local_
WHERE pd local_tax_code IS NULL LAST;


--11.The expected_profit of an employee is defined as
--(48 * 35 * charge_cost - salary) * fte_hours,
-- where charge_cost depends upon the team to which the employee belongs.
--Get a table showing expected_profit for each employee.

SELECT
	e.first_name,
	e.last_name,
	(48 * 35 * CAST(t.charge_cost AS INT) - e.salary)
		* e.fte_hours AS expected_profit
FROM employees AS e LEFT JOIN teams AS t 
ON e.id = t.id;



--12. [Tough] Get a list of the id, first_name, last_name,
--salary and fte_hours of employees in the largest department.
--Add two extra columns showing the ratio of each employee’s salary
--to that department’s average salary, and each employee’s fte_hours
--to that department’s average fte_hours.


WITH department_avgs (department, num_employees, avg_salary, avg_fte_hours) AS (
SELECT 
	department,
	count(id),
	AVG(salary),
	AVG(fte_hours) 
FROM employees 
GROUP BY department
ORDER BY count(id) DESC
LIMIT 1
)
SELECT
	e.id,
	e.first_name,
	e.last_name,
	e.salary,
	e.salary / department_avgs.avg_salary AS salary_ratio,
	e.fte_hours / department_avgs.avg_fte_hours AS fte_ratio
FROM employees AS e RIGHT JOIN department_avgs 
ON e.department = department_avgs.department


--Extension Questions

--1. Return a table of those employee first_names shared by more than
--one employee, together with a count of the number of times each
--first_name occurs. Omit employees without a stored first_name from the table.
--Order the table descending by count, and then alphabetically by first_name.


SELECT
	first_name,
	COUNT(first_name) AS name_count,
	



--2. Have a look again at your table for core question 6.
-- It will likely contain a blank cell for the row relating to
--employees with ‘unknown’ pension enrollment status.
-- This is ambiguous: it would be better if this cell contained 
--‘unknown’ or something similar. Can you find a way to do this,
-- perhaps using a combination of COALESCE() and CAST(), or a CASE statement?
	
	SELECT *
	COUNT(id) AS number_of_employees,
	CAST(pension_enrol AS VARCHAR)
	COALESCE(pension_enrol)
FROM employees 
WHERE pension_enrol = TRUE
GROUP BY pension_erole


-- 3.Find the first name, last name, email address and start date of all
--the employees who are members of the ‘Equality and Diversity’
-- committee. Order the member employees by their length of
-- service in the company, longest first.

SELECT
	e.first_name,
	e.last_name,
	e.email,
	e.start_date,
	ec.employee_id,
	ec.committe_id,
	c.name
FROM employees AS e LEFT JOIN employees_committees AS ec
ON e.id  employee_id 
FROM employees_committees INNER JOIN 
WHERE c.name = 'Equality and Diversity'
ORDER by e.start_date 



--4.[Tough!] Use a CASE() operator to group employees who are members
--of committees into salary_class of 'low' (salary < 40000) or 'high'
--(salary >= 40000). A NULL salary should lead to 'none' in salary_class.
--Count the number of committee members in each salary_class.



