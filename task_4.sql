CREATE DATABASE IF NOT EXISTS olist;
USE olist;

CREATE TABLE IF NOT EXISTS customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(50),
    customer_state VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price FLOAT,
    freight_value FLOAT
);

CREATE TABLE IF NOT EXISTS order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value FLOAT
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_payments_dataset.csv'
INTO TABLE order_payments
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT c.customer_state, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;
show tables;
SELECT order_id, SUM(payment_value) AS total_payment
FROM order_payments
GROUP BY order_id;
SELECT order_id, SUM(payment_value) AS total_payment
FROM order_payments
GROUP BY order_id
ORDER BY total_payment DESC
LIMIT 5;
SELECT order_id, product_id, price
FROM order_items
ORDER BY price DESC
LIMIT 5;
SELECT customer_state, COUNT(*) AS order_count
FROM customers
GROUP BY customer_state
ORDER BY order_count DESC;
SELECT 
    oi.order_id,
    ROUND(SUM(oi.price), 2) AS total_item_price,
    ROUND(SUM(p.payment_value), 2) AS total_payment
FROM order_items oi
JOIN order_payments p ON oi.order_id = p.order_id
GROUP BY oi.order_id
ORDER BY total_payment DESC
LIMIT 5;
SELECT payment_type, COUNT(*) AS count, ROUND(SUM(payment_value), 2) AS total
FROM order_payments
GROUP BY payment_type;
CREATE VIEW high_value_orders AS
SELECT order_id, SUM(payment_value) AS total_payment
FROM order_payments
GROUP BY order_id
HAVING total_payment > 500;