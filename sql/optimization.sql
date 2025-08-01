SET search_path TO sales;

-- Task 1: Daily sales report
SELECT 
    DATE(o.order_date) AS sale_date,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS daily_revenue
FROM orders o
WHERE o.status = 'completed'
GROUP BY DATE(o.order_date)
ORDER BY sale_date;

-- Task 2: Create indexes on frequently filtered columns
CREATE INDEX idx_orders_date_status ON orders (order_date, status);
CREATE INDEX idx_payments_order_id ON payments (order_id);

-- Task 3: Use EXPLAIN to review query performance
EXPLAIN ANALYZE
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
AND o.status = 'completed';

-- Task 4: Create a view for simplified reporting
CREATE VIEW daily_sales_report AS
SELECT 
    DATE(o.order_date) AS sale_date,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS daily_revenue
FROM orders o
WHERE o.status = 'completed'
GROUP BY DATE(o.order_date);

-- Comment for documentation
COMMENT ON VIEW daily_sales_report IS 'View for daily sales report showing order count and revenue';