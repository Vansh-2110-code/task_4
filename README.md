
# task 4

##  Tools Used
- MySQL Server 8.0
- MySQL Workbench
- CSV datasets from the Olist Brazilian e-commerce dataset

##  Database Tables

### customers
Contains customer location and ID info.

### order_items
Contains product-level transaction info including price and shipping.

### order_payments
Includes payment method and amount per order.

##  SQL Concepts Used

- `CREATE TABLE`, `LOAD DATA INFILE`
- `JOIN`, `GROUP BY`, `ORDER BY`, `LIMIT`
- Aggregate functions: `SUM()`, `COUNT()`, `ROUND()`
- `CREATE VIEW` for reusable analysis
- Indexing for optimization

##  Key Queries

- Total orders by state
- Total and top 5 payments by order
- Most expensive order items
- Top 5 orders (JOIN of items and payments)
- Payment summary by type
- View for high-value orders
