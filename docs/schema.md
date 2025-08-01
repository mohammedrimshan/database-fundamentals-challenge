# Schema Documentation

## ER Diagram Description
- **customers**: Primary key `customer_id`, unique `email`.
- **products**: Primary key `product_id`.
- **orders**: Primary key `order_id`, foreign key `customer_id` references `customers`.
- **payments**: Primary key `payment_id`, foreign key `order_id` references `orders`.

## Constraints
- `NOT NULL`: Ensures critical fields (e.g., `email`, `order_date`) are populated.
- `UNIQUE`: Prevents duplicate `email` in `customers`.
- `CHECK`: Validates `unit_price`, `total_amount`, `amount` are positive; restricts `status` and `payment_status` to valid values.
- `FOREIGN KEY`: Ensures referential integrity between tables.

## Indexes
- `idx_orders_date_status`: On `orders(order_date, status)` for range queries and filtering.
- `idx_payments_order_id`: On `payments(order_id)` for efficient joins.