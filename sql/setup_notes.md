# SQL Setup Notes

## Database
- SQL written for: PostgreSQL (ANSI-compliant)
- Queries are read-only and safe to execute

## Required Tables
- customers(customer_id, customer_name)
- orders(order_id, customer_id, order_date, order_total)

## Parameter Placeholders
The following placeholders are used in validation queries and should be replaced
with appropriate values when executing:

- :customer_id
- :from_date
- :to_date
- :min_total
- :min_total

## Usage
These queries are used as source-of-truth validation for API responses.
They are intended for manual execution during QA testing.

