# QA Test Plan — API + SQL Validation

## 1) Purpose
Validate that the API returns correct customer/order data and that API responses match the database (customers, orders).

## 2) Scope
### Endpoints in scope
- GET /v1/customers
- GET /v1/customers/{customer_id}
- GET /v1/customers/{customer_id}/orders?from=YYYY-MM-DD&to=YYYY-MM-DD
- GET /v1/orders?min_total=NUMBER&max_total=NUMBER

### Out of scope (for now)
- Auth, rate limiting, pagination, create/update/delete operations
- Performance/load testing
- UI testing

## 3) Contract Rules (must always hold)
- customer_id, order_id are integers
- order_total is numeric and >= 0
- order_date is ISO date (YYYY-MM-DD)
- Every returned order must map to an existing customer (FK integrity expectation)

## 4) Test Environment Requirements
- Base URL available (e.g., local server or mock server)
- Ability to run SQL against the same dataset the API reads from
- A known “seed” dataset (or at least stable data during testing)

## 5) Test Data Requirements (minimum)
Have at least:
- 1 customer with 0 orders
- 1 customer with 1 order
- 1 customer with multiple orders across different dates
- Orders that hit boundaries:
  - order_total = 0
  - order_total near min/max filter edges
  - dates exactly equal to from/to edges (to test inclusivity)

## 6) How We’ll Execute Tests (Manual Postman-style)
For each endpoint test:
1. Send request
2. Capture response JSON
3. Validate contract rules (types, formats, required fields)
4. Validate business logic (filters, customer scoping)
5. Validate database truth with SQL (row counts + spot-check records)

## 7) Pass/Fail Criteria
A test **passes** if:
- Response matches contract rules
- Response matches expected filtering/scoping behavior
- API results match SQL truth (count + key fields)

A test **fails** if:
- Any contract rule is violated
- Filtering returns incorrect rows (missing or extra)
- Any order returns with a customer_id not present in customers table
- API results disagree with SQL for the same criteria

## 8) Defect Logging (GitHub Issues)
When you find a defect, log:
- Title: [Endpoint] short summary
- Steps to reproduce (request + params)
- Expected result (include SQL query used)
- Actual result (include response snippet)
- Severity: Blocker / High / Medium / Low
- Evidence: screenshots or copied JSON (trim sensitive info)

## 9) SQL Validation Queries (templates)
> Replace placeholders like :customer_id, :from, :to, :min_total, :max_total

### A) Customers list count
SELECT COUNT(*) AS api_expected_count
FROM customers;

### B) Single customer exists
SELECT *
FROM customers
WHERE customer_id = :customer_id;

### C) Orders for a customer with optional date filters
SELECT *
FROM orders
WHERE customer_id = :customer_id
  AND (:from IS NULL OR order_date >= :from)
  AND (:to   IS NULL OR order_date <= :to)
ORDER BY order_date, order_id;

### D) Orders filtered by totals
SELECT *
FROM orders
WHERE (:min_total IS NULL OR order_total >= :min_total)
  AND (:max_total IS NULL OR order_total <= :max_total)
ORDER BY order_total, order_id;

### E) FK integrity check (should return 0 rows)
SELECT o.*
FROM orders o
LEFT JOIN customers c
  ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

