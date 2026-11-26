-- ==========================================
-- ADVANCED ANALYTICAL QUERIES
-- Project: HR & Employee Analytics
-- ==========================================

USE employee_db;

-- ==========================================
-- SECTION 1: JOINS (Connecting Tables)
-- ==========================================

-- 1. INNER JOIN: Show employee name, salary, and their department's manager
SELECT e.name, e.salary, d.manager_name
FROM employees e
INNER JOIN departments d ON e.dept_name = d.dept_name;

-- 2. LEFT JOIN & ANTI-JOIN: Find employees who are not assigned to a valid department
-- (Since we have a Foreign Key, this should return 0 rows, which is a good thing!)
SELECT e.name, e.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_name = d.dept_name
WHERE d.dept_name IS NULL;

-- ==========================================
-- SECTION 2: WINDOW FUNCTIONS (Advanced Analytics)
-- ==========================================

-- 3. RANK(): Rank employees by salary within their specific department
SELECT 
    name, 
    dept_name, 
    salary,
    RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 4. LAG(): Compare an employee's salary to the previous employee's salary
SELECT 
    name, 
    salary,
    LAG(salary) OVER(ORDER BY salary DESC) AS previous_higher_salary
FROM employees;

-- ==========================================
-- SECTION 3: SUBQUERIES
-- ==========================================

-- 5. SUBQUERY: Find employees who earn more than the company average
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- ==========================================
-- SECTION 4: VIEWS (Virtual Tables)
-- ==========================================

-- 6. VIEW: Create a reusable view for high earners
CREATE VIEW high_earners AS
SELECT name, dept_name, salary 
FROM employees 
WHERE salary > 60000;

-- Query the View (Notice how simple it is!)
SELECT * FROM high_earners;

-- ==========================================
-- SECTION 5: TRANSACTIONS (Data Safety)
-- ==========================================

-- 7. TRANSACTION: Safely give a 5% raise to the 'eng' department
START TRANSACTION;
UPDATE employees 
SET salary = salary * 1.05 
WHERE dept_name = 'eng';
-- (If the update was successful, commit it)
COMMIT;
