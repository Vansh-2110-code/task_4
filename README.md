
# Olist SQL Data Analysis Project

This project showcases data analysis using SQL on three key tables from the Olist e-commerce dataset:
- `customers`
- `order_items`
- `order_payments`

## 📁 Project Structure
- SQL scripts for table creation and data loading
- Queries to extract insights using joins, aggregations, and views
- Screenshots and documentation (in Word)
- This README file

## 🔧 Tools Used
- MySQL Server 8.0
- MySQL Workbench
- CSV datasets from the Olist Brazilian e-commerce dataset

## 🗃️ Database Tables

### customers
Contains customer location and ID info.

### order_items
Contains product-level transaction info including price and shipping.

### order_payments
Includes payment method and amount per order.

## ⚙️ Setup Instructions

1. Place CSV files in:
   ```
   C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/
   ```

2. Run the provided SQL script to:
   - Create database and tables
   - Load CSV data using `LOAD DATA INFILE`

## 🧠 SQL Concepts Used

- `CREATE TABLE`, `LOAD DATA INFILE`
- `JOIN`, `GROUP BY`, `ORDER BY`, `LIMIT`
- Aggregate functions: `SUM()`, `COUNT()`, `ROUND()`
- `CREATE VIEW` for reusable analysis
- Indexing for optimization

## 🧪 Key Queries

- Total orders by state
- Total and top 5 payments by order
- Most expensive order items
- Top 5 orders (JOIN of items and payments)
- Payment summary by type
- View for high-value orders

## 📊 Sample Output

```
SELECT 
    oi.order_id,
    ROUND(SUM(oi.price), 2) AS total_item_price,
    ROUND(SUM(p.payment_value), 2) AS total_payment
FROM order_items oi
JOIN order_payments p ON oi.order_id = p.order_id
GROUP BY oi.order_id
ORDER BY total_payment DESC
LIMIT 5;
```

## 📄 Documentation

All queries and explanation are provided in:
- `Olist_SQL_Full_Task_Documentation.docx`

---

### ✅ Author
*This project was completed as part of a data analyst internship task.*
