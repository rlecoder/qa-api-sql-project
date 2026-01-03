# Manual Test Cases — Customers & Orders API (v1)

Conventions:
- Save each API response JSON in `evidence/response_samples/` named like `TC-001.json`
- If a test fails, log it in `docs/defects.md` and attach evidence

---

## TC-001 — GET /v1/customers returns all customers
**Request**
- Method: GET
- Endpoint: /v1/customers

**Expected**
- Status: 200
- Body is a JSON array
- Each item includes: customer_id (int), customer_name (string)

**SQL Validation**
```sql
SELECT COUNT(*) AS customer_count
FROM customers;
