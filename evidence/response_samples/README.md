# Customers & Orders QA Practice Project

Manual QA practice project focused on **API testing + SQL validation** for a simple `customers` / `orders` system.

The goal is to show how a QA tester can:
- Read an API contract
- Design positive + negative test cases
- Validate API responses against the database using SQL
- Capture evidence of actual API responses
- Log defects when API behavior doesn’t match expectations

---

## Scope

**API (mocked in Postman):**

Base path:
- `/v1`

Endpoints:
- `GET /v1/customers`  
  Returns all customers.

- `GET /v1/customers/{customer_id}`  
  Returns a single customer by ID.

- `GET /v1/customers/{customer_id}/orders`  
  Returns all orders for a customer, optionally filtered by date.

- `GET /v1/orders?min_total=&max_total=`  
  Returns orders filtered by total amount.

Only **GET** endpoints are covered in this version of the project.

---

## Repository Structure

```text
.
├── docs/
│   ├── api_contract.md        # API endpoints and rules
│   ├── edge_cases.md          # Edge cases and weird scenarios to consider
│   ├── test_cases.md          # Manual test cases (positive + negative)
│   └── defects.md             # (Planned) Defect log when API ≠ expected
│
├── sql/
│   ├── validation_queries.sql # SQL used to cross-check API responses
│   └── setup_notes.md         # Notes on how the data / tables are assumed
│
├── evidence/
│   └── response_samples/
│       ├── TC-001-response.json  # Actual API response for TC-001 (GET /v1/customers)
│       └── TC-002-response.json  # Actual API response for TC-002 (GET /v1/customers/{id})
│
└── README.md

