# API Contract — Customers & Orders (v1)

## Base Path
/v1

---

## Endpoints

### GET /customers
Returns a list of all customers.

---

### GET /customers/{customer_id}
Returns a single customer by ID.

Path parameters:
- customer_id (integer, required)

---

### GET /customers/{customer_id}/orders
Returns all orders for a specific customer.

Path parameters:
- customer_id (integer, required)

Query parameters (optional):
- from (YYYY-MM-DD)
- to (YYYY-MM-DD)

---

### GET /orders
Returns orders filtered by order total.

Query parameters (optional):
- min_total (numeric)
- max_total (numeric)

---

## Response Requirements

- customer_id and order_id must be integers
- order_total must be numeric and >= 0
- order_date must be ISO format (YYYY-MM-DD)
- Every order must reference an existing customer_id
- Empty results must return an empty array ([]), not null
