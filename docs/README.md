# Database Fundamentals Challenge

This project implements a PostgreSQL database for managing customers, products, orders, and payments, with queries and optimizations as per the technical assessment.

## Setup Instructions
1. Install PostgreSQL (version 16 recommended, per resource: https://www.postgresql.org/docs/).
2. Create a database: `CREATE DATABASE sales_db;`.
3. Run `sql/schema.sql` to create tables.
4. Run `sql/queries.sql` for querying tasks.
5. Run `sql/optimization.sql` for reports and optimizations.

## Project Structure
- `sql/schema.sql`: Table definitions with constraints.
- `sql/queries.sql`: Queries for joins and aggregations.
- `sql/optimization.sql`: Daily sales report, indexes, EXPLAIN, and view.
- `docs/schema.md`: Schema documentation.

## Schema Overview
- **customers**: Stores customer details (customer_id, first_name, last_name, email).
- **products**: Stores product details (product_id, product_name, unit_price).
- **orders**: Stores order transactions (order_id, customer_id, order_date, status, total_amount).
- **payments**: Stores payment transactions (payment_id, order_id, payment_date, amount, payment_status).

## Notes
- Indexes optimize frequent filters (`order_date`, `status`, `order_id`).
- The `daily_sales_report` view simplifies reporting.
- Use `EXPLAIN ANALYZE` to verify query performance.

## Resources
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [SQL Performance Explained](https://use-the-index-luke.com/)
- [SQLBolt](https://sqlbolt.com/)