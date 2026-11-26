-- ==========================================
-- BUSINESS ANALYSIS QUERIES
-- Project: HR & Employee Analytics
-- ==========================================

USE employee_db;

-- Question 1: Who are the top 3 highest-paid employees?
SELECT name, dept_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- Question 2: What is the average salary and total payroll for each department?
SELECT dept_name, 
       COUNT(*) AS total_employees,
       AVG(salary) AS average_salary,
       SUM(salary) AS total_payroll
FROM employees
GROUP BY dept_name;

-- Question 3: Which employees were born after 1995 and work in 'eng'?
SELECT name, YEAR(birth_date) AS birth_year
FROM employees
WHERE birth_date > '1995-12-31' AND dept_name = 'eng';

-- Question 4: Show the department name, manager, and employee names (JOIN)
SELECT e.name AS employee_name, 
       d.dept_name, 
       d.manager_name, 
       d.budget
FROM employees e
INNER JOIN departments d ON e.dept_name = d.dept_name;

-- Question 5: Who earns more than the company average salary? (Subquery)
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Question 6: Format the employee names and emails, replacing missing emails with 'No Email'
SELECT CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS formatted_name,
       IFNULL(email, 'No Email') AS contact_email
FROM employees;
