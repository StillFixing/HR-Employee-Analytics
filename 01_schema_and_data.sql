-- ==========================================
-- DATABASE SCHEMA & SAMPLE DATA
-- Project: HR & Employee Analytics
-- ==========================================

CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;

-- 1. Create Departments Table
CREATE TABLE departments (
    dept_name VARCHAR(50) PRIMARY KEY,
    manager_name VARCHAR(100),
    budget DECIMAL(12,2)
);

-- 2. Create Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dept_name VARCHAR(50),
    salary DECIMAL(10,2) NOT NULL,
    phone_number VARCHAR(15),
    birth_date DATE,
    email VARCHAR(100),
    FOREIGN KEY (dept_name) REFERENCES departments(dept_name)
);

-- 3. Insert Department Data
INSERT INTO departments (dept_name, manager_name, budget) VALUES
('comp', 'Mr. Sharma', 500000),
('eng', 'Ms. Verma', 800000),
('sales', 'Mr. Gupta', 300000),
('hr', 'Mrs. Singh', 200000);

-- 4. Insert Employee Data (I've added a few real examples here)
INSERT INTO employees (name, dept_name, salary, phone_number, birth_date, email) VALUES
('Ajoy Sharma', 'eng', 65000, '98765-43210', '1998-05-12', 'ajoy@gmail.com'),
('Raj Patel', 'eng', 72000, '9823456781', '1995-11-20', 'raj.patel@gmail.com'),
('Priya Nair', 'comp', 51000, '9812345672', '1997-03-08', 'priya@yahoo.com'),
('Vikram Singh', 'sales', 38000, NULL, '1993-07-15', 'vikram@outlook.com'),
('Ananya Iyer', 'eng', 80000, '9867891234', '1994-01-30', 'ananya@gmail.com'),
('Rohan Mehta', 'hr', 42000, '9878902345', '1996-09-22', NULL),
('Sneha Kapoor', 'sales', 41000, '9889013456', '1999-12-05', 'sneha@gmail.com'),
('Arjun Reddy', 'eng', 68000, '9890124567', '1992-06-18', 'arjun@gmail.com');
