#Create Database & Tables
CREATE DATABASE sales_analytics;
USE sales_analytics;

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

-- Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items table
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

#Insert Sample Data
INSERT INTO customers (name, email, city) VALUES
('Ravi Kumar', 'ravi@gmail.com', 'Chennai'),
('Sneha R', 'sneha@yahoo.com', 'Mumbai'),
('Ajay Singh', 'ajay@gmail.com', 'Delhi');

INSERT INTO products (product_name, price, stock) VALUES
('Laptop', 55000, 10),
('Headphones', 2500, 50),
('Keyboard', 1200, 30);

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-01-10'),
(2, '2025-01-12');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),  
(2, 2, 3),  
(2, 3, 2);

#VIEW (For Data Analysis)
#View: Total spending by each customer
CREATE VIEW customer_spending AS
SELECT c.name, c.city,
       SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id;

#View Usage:
SELECT * FROM customer_spending;

#STORED PROCEDURE (Get sales summary for a given product)
DELIMITER $$

CREATE PROCEDURE GetProductSales(IN prod_id INT)
BEGIN
    SELECT p.product_name, SUM(oi.quantity) AS total_units_sold,
           SUM(oi.quantity * p.price) AS total_revenue
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    WHERE oi.product_id = prod_id
    GROUP BY p.product_id;
END $$

DELIMITER ;

#Run the procedure:
CALL GetProductSales(2);

#TRIGGER (Auto reduce stock when order_items insert happens)
DELIMITER $$

CREATE TRIGGER reduce_stock
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END $$

DELIMITER ;

#JOIN Query (Sales Report with customer → order → product)
SELECT c.name AS customer,
       p.product_name,
       oi.quantity,
       p.price,
       (oi.quantity * p.price) AS total_amount
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id;

