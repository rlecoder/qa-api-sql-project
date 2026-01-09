# Manual Test Cases — Customers & Orders API (v1)

TC-001 — Get all customers

Request
Method: GET
Endpoint: /v1/customers

Expected
Status: 200
Response body is a JSON array
Each item includes:
- customer_id (integer)
- customer_name (string)

SQL Validation
SELECT COUNT(*) AS customer_count
FROM customers;

--------------------------------------------------

TC-002 — Get customer by valid ID

Request
Method: GET
Endpoint: /v1/customers/{customer_id}

Expected
Status: 200
Returned customer_id matches the requested ID
customer_name is present

SQL Validation
SELECT customer_id, customer_name
FROM customers
WHERE customer_id = :customer_id;

--------------------------------------------------

TC-003 — Get customer by invalid ID

Request
Method: GET
Endpoint: /v1/customers/{invalid_customer_id}

Expected
Status: 404
No customer object returned

SQL Validation
SELECT 1
FROM customers
WHERE customer_id = :invalid_customer_id;

--------------------------------------------------

TC-004 — Get orders for a customer

Request
Method: GET
Endpoint: /v1/customers/{customer_id}/orders

Expected
Status: 200
Response body is a JSON array
All returned orders have the requested customer_id
order_total is numeric and >= 0
order_date format is YYYY-MM-DD

SQL Validation
SELECT order_id, customer_id, order_date, order_total
FROM orders
WHERE customer_id = :customer_id;

--------------------------------------------------

TC-005 — Get customer orders with date filter

Request
Method: GET
Endpoint: /v1/customers/{customer_id}/orders?from=YYYY-MM-DD&to=YYYY-MM-DD

Expected
Status: 200
Only orders within the date range are returned
Date range is inclusive

SQL Validation
SELECT order_id, order_date
FROM orders
WHERE customer_id = :customer_id
AND order_date BETWEEN :from_date AND :to_date;

--------------------------------------------------

TC-006 — Filter orders by total amount

Request
Method: GET
Endpoint: /v1/orders?min_total=NUMBER&max_total=NUMBER

Expected
Status: 200
All returned orders have order_total within the given range

SQL Validation
SELECT order_id, order_total
FROM orders
WHERE order_total BETWEEN :min_total AND :max_total;

--------------------------------------------------

TC-007 — Invalid date format for orders

Request
Method: GET
Endpoint: /v1/customers/{customer_id}/orders?from=01-10-2025&to=2025/01/20

Expected
Status: 400 Bad Request (or the defined error status for invalid dates)
Response body is a JSON error object containing:
- An error message indicating the date format is invalid (expected YYYY-MM-DD)
No order data is returned

SQL Validation
Not required — request is invalid and should not hit the database.

--------------------------------------------------

TC-008 — Invalid total range (min_total > max_total)

Request
Method: GET
Endpoint: /v1/orders?min_total=500&max_total=100

Expected
Status: 400 Bad Request (or the defined error status for invalid ranges)
Response body is a JSON error object containing:
- An error message indicating the total range is invalid
No order data is returned

SQL Validation
Not required — request is invalid and should not hit the database.

--------------------------------------------------

TC-009 — Missing required path parameter (customer_id)

Request
Method: GET
Endpoint: /v1/customers//orders   (or /v1/customers/orders depending on how the client sends it)

Expected
Status: 400 Bad Request (or 404 Not Found, depending on API design)
Response body is a JSON error object containing:
- An error message indicating customer_id is required
No order data is returned

SQL Validation
Not required — request is invalid and should not hit the database.

--------------------------------------------------

TC-010 — Non-numeric customer_id

Request
Method: GET
Endpoint: /v1/customers/abc/orders   (also valid to test /v1/customers/12a/orders, /v1/customers/@@@/orders, etc.)

Expected
Status: 400 Bad Request (or 404 Not Found, depending on API design)
Response body is a JSON error object containing:
- An error message indicating customer_id must be numeric
No customer or order data is returned

SQL Validation
Not required — request is invalid and should not hit the database.
