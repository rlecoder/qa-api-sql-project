# Manual Test Cases — Customers & Orders API (v1)

This document defines all test cases TC-001 to TC-010 covered by this project.

---

## TC-001 — Get all customers

**Request**  
GET /v1/customers

**Expected**  
200 OK  
JSON array of customers  
Fields:
- customer_id (int)
- customer_name (string)

**SQL Validation**
```sql
SELECT COUNT(*) FROM customers;
SELECT customer_id, customer_name FROM customers;
