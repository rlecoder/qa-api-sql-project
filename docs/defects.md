# Defects Log — Customers & Orders API (v1)

This file documents mismatches found during manual API testing.  
Each defect includes:  
- Summary  
- Steps to reproduce  
- Expected result  
- Actual result  
- Severity  
- Notes for developers  

---

## DEFECT-001 — customer_id returned as string instead of integer

**Endpoint:**  
`GET /v1/customers`

**Steps to Reproduce:**  
1. Send GET request to `/v1/customers`  
2. Inspect the response body  

**Expected Result:**  
`customer_id` should be returned as an integer (e.g., `1`)

**Actual Result:**  
`customer_id` is returned as a string (e.g., `"1"`)

**Severity:**  
Medium  
- Impacts data validation  
- May cause UI/API parsing issues  
- Violates API contract specification  

**Notes:**  
Likely caused by the mock or backend serialization layer representing IDs as strings.  

## DEFECT-002 — Order below min_total returned in filtered orders

**Endpoint:**  
`GET /v1/orders?min_total=100&max_total=500`

**Steps to Reproduce:**
1. Send a GET request to `/v1/orders?min_total=100&max_total=500`.
2. Inspect the `order_total` values in the response.

**Expected Result:**
All returned orders should have:
- `order_total >= min_total` (100)
- `order_total <= max_total` (500)

No orders with `order_total < 100` should be included.

**Actual Result (original mock data):**
Response included an order:

```json
{
  "order_id": 101,
  "customer_id": 1,
  "order_date": "2024-01-12",
  "order_total": 89.99
}
