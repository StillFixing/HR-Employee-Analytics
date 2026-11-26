# 📊 HR & Employee Analytics (SQL Project)

## 📌 Project Overview
This project demonstrates my SQL skills by analyzing a simulated HR database. It includes two related tables (`employees` and `departments`) and answers real-world business questions using advanced SQL techniques, moving from basic aggregations to complex Window Functions and Data Safety (Transactions).

## 🛠️ Skills Demonstrated
- **DDL (Data Definition):** Creating tables with `PRIMARY KEY`, `FOREIGN KEY`, `CHECK` constraints, and `INDEXES`.
- **DML (Data Manipulation):** Inserting relational data and updating records safely.
- **JOINs:** Combining data using `INNER JOIN` and `LEFT JOIN` (including finding orphaned records with Anti-Joins).
- **Aggregations:** Using `COUNT`, `SUM`, `AVG`, `GROUP BY`, and `HAVING`.
- **Subqueries:** Filtering data based on aggregated results (e.g., comparing to the company average).
- **Window Functions:** Using `RANK()`, `PARTITION BY`, and `LAG()` for advanced department-level analytics.
- **Views:** Creating reusable virtual tables (`CREATE VIEW`) to simplify complex queries.
- **Transactions (TCL):** Ensuring data safety using `START TRANSACTION` and `COMMIT`.

## 📂 Files in this Repository
- `01_schema_and_data.sql`: The script to create the database, enforce constraints, build indexes, and insert sample data.
- `02_analysis_queries.sql`: Basic business analysis queries using JOINs and Aggregations.
- `03_advanced_queries.sql`: Advanced queries demonstrating Window Functions, Subqueries, Views, and Transactions.

## 💡 Key Business Questions Answered
1. How do department managers and budgets relate to their employees? (JOIN)
2. Who are the top earners *within each specific department*? (Window Functions - `RANK`)
3. How does an employee's salary compare to the person ranked directly above them? (Window Functions - `LAG`)
4. Who earns more than the entire company average? (Subquery)
5. Which departments have a higher-than-average salary? (Aggregation & HAVING)
6. How can we safely give a 5% raise to a specific department without risking data corruption? (Transactions)
