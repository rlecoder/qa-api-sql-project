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

