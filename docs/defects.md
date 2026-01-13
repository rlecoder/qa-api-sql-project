# Defects Log — Customers & Orders API (v1)

This file lists the issues found while testing the Customers & Orders API using Postman.  
These defects came from comparing the mock API responses to the API contract.  
Since this is a mock server, these problems were caused by incorrect sample JSON — not a real backend.

---

## DEFECT-001 — `customer_id` returned as a string instead of an integer

**Endpoint:**  
`GET /v1/customers`

**Steps to Reproduce:**
1. Send GET `/v1/customers`
2. Check the data type of `customer_id`

**Expected Result:**  
`customer_id` should be a number (example: `1`)

**Actual Result:**
```json
{
  "customer_id": "1",
  "customer_name": "Alice"
}
```

**Severity:** Medium  
**Notes:** Fixed in mock data after being reported.

---

## DEFECT-002 — `customer_name` returned in lowercase incorrectly

**Endpoint:**  
`GET /v1/customers/2`

**Steps to Reproduce:**
1. Send GET `/v1/customers/2`
2. Observe the formatting of `customer_name`

**Expected Result:**  
Name retains correct capitalization (example: `"Bob"`)

**Actual Result:**
```json
{
  "customer_id": 2,
  "customer_name": "bob"
}
```

**Severity:** Low  
**Notes:** Cosmetic issue but incorrect; mock response updated.

---

## DEFECT-003 — Order below `min_total` returned in filtered orders

**Endpoint:**  
`GET /v1/orders?min_total=100&max_total=500`

**Steps to Reproduce:**
1. Send GET `/v1/orders?min_total=100&max_total=500`
2. Check if each `order_total` matches the filter criteria

**Expected Result:**  
All returned orders must fall within the range 100–500

**Actual Result:**
```json
{
  "order_id": 101,
  "customer_id": 1,
  "order_date": "2024-01-12",
  "order_total": 89.99
}
```

**Severity:** Medium  
**Notes:** Filtering logic incorrect in mock data; fixed after identification.

---
