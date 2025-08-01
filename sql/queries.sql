SET search_path TO sales;

-- Query 1: Join customer and order tables to show recent orders
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.status,
    o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= CURRENT_DATE - INTERVAL '30 days'
ORDER BY o.order_date DESC;

-- Query 2: Calculate total sales per customer
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS total_sales
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(o.total_amount) > 0
ORDER BY total_sales DESC;

-- Query 3: Filter by date range and order status
SELECT 
    o.order_id,
    o.order_date,
    o.status,
    o.total_amount,
    c.first_name,
    c.last_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date BETWEEN '2025-01-01' AND '2025-12-31'
AND o.status = 'completed'
ORDER BY o.order_date;

-- Query 4: Example with aggregate functions
SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue
FROM orders o
WHERE o.status = 'completed'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;