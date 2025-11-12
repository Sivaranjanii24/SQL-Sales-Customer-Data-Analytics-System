
---

# 🧾 Sales Analytics SQL Project

## 📊 Project Overview

The **Sales Analytics** project is designed to demonstrate SQL skills through a real-world-style database system.
It helps analyze customer spending, product sales, and automatically manages stock after each order.
The project focuses on using core SQL features like joins, views, stored procedures, and triggers for data analysis and automation.

---

## 🏗️ Database Structure

The database named **sales_analytics** consists of four main tables:

* **Customers** – Stores customer details such as name, email, and city.
* **Products** – Contains product information including name, price, and available stock.
* **Orders** – Records orders placed by customers along with order dates.
* **Order Items** – Holds details of products purchased in each order.

All tables are connected through primary and foreign keys, ensuring proper relationships and referential integrity.

---

## 🧠 SQL Concepts Used

### 🔹 Joins

Used to connect multiple tables to generate detailed sales reports combining customer, order, and product information.

### 🔹 Views

A view was created to show the **total spending by each customer**.
This helps quickly identify top customers and understand purchase behavior.

### 🔹 Stored Procedure

A stored procedure was developed to generate a **sales summary for a specific product**, showing total units sold and total revenue.
This provides insights into product performance.

### 🔹 Trigger

A trigger automatically reduces the product stock whenever a new order item is inserted.
It keeps the inventory data accurate and up to date without manual updates.

---

## 📈 Output and Insights

* **Customer Spending View:** Displays total amount spent by each customer and their city.
* **Product Sales Procedure:** Returns the total units sold and revenue for any selected product.
* **Trigger Automation:** Updates stock in real-time after each order.
* **Sales Report Join:** Combines all tables to show detailed sales data for analysis.

---

## ⚙️ How to Run the Project

1. Open **MySQL Workbench** or **phpMyAdmin**.
2. Copy the SQL script and execute it step by step.
3. The database, tables, and relationships will be created automatically.
4. Insert the sample data provided.
5. Run the queries, views, and stored procedures to see the output.

---

## 🧩 Skills Demonstrated

* SQL database design and normalization
* Data analysis using joins and aggregation
* Automation with triggers and stored procedures
* Analytical thinking for business insights
* Efficient data organization for reporting

---

## 👩‍💻 Author

**Sivaranjani**
SQL Developer & Data Analytics Enthusiast

---
