# Manual Test Cases — Customers & Orders API (v1)

This document defines test cases TC-001 to TC-010.

---

## TC-001 — Get all customers

Request: GET /v1/customers  
Expected: 200 OK, array of customers

SQL:
SELECT COUNT(*) FROM customers;
SELECT customer_id, customer_name FROM customers;

---

## TC-002 — Get customer by valid ID

Request: GET /v1/customers/{customer_id}  
Expected: 200 OK, correct customer

SQL:
SELECT customer_id, customer_name 
FROM customers 
WHERE customer_id = :customer_id;

---

## TC-003 — Get customer by invalid ID

Request: GET /v1/customers/9999  
Expected: 404 Not Found

SQL:
SELECT 1 FROM customers WHERE customer_id = :invalid_customer_id;

---

## TC-004 — Get orders for a customer

Request: GET /v1/customers/{customer_id}/orders  
Expected: 200 OK, only that customer’s orders

SQL:
SELECT order_id, customer_id, order_date, order_total
FROM orders
WHERE customer_id = :customer_id;

---

## TC-005 — Orders within date range

Request:  
GET /v1/customers/{customer_id}/orders?from=YYYY-MM-DD&to=YYYY-MM-DD

Expected:  
200 OK, orders within range

SQL:
SELECT order_id, order_date, order_total
FROM orders
WHERE customer_id = :customer_id
  AND order_date BETWEEN :from_date AND :to_date;

---

## TC-006 — Filter orders by totals

Request: GET /v1/orders?min_total=100&max_total=500  
Expected: Only orders 100–500

SQL:
SELECT order_id, customer_id, order_total
FROM orders
WHERE order_total BETWEEN :min_total AND :max_total;

---

## TC-007 — Invalid date format

Request:  
GET /v1/customers/{customer_id}/orders?from=01-10-2024&to=2024/01/20

Expected:  
400 Bad Request or error message

SQL: none

---

## TC-008 — Reversed date range

Request:  
GET /v1/customers/{customer_id}/orders?from=2024-02-01&to=2024-01-01

Expected:  
400 OR empty array

SQL:
SELECT order_id
FROM orders
WHERE customer_id = :customer_id
  AND order_date BETWEEN :from_date AND :to_date;

---

## TC-009 — Non-numeric totals

Request:  
GET /v1/orders?min_total=abc&max_total=500

Expected:  
400 Bad Request

SQL: none

---

## TC-010 — Large dataset performance

Request:  
GET /v1/orders?min_total=0&max_total=999999999

Expected:  
200 OK, handles large data

SQL:
SELECT order_id, customer_id, order_total
FROM orders
WHERE order_total BETWEEN 0 AND 999999999;
