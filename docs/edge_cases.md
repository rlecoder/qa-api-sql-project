# Edge Cases — Customers & Orders API (v1)

Covers edge conditions for TC-001 through TC-010.

---

## Customer Edge Cases

- No customers → return []
- Single customer → return array of 1
- Special characters in names
- Very large customer_id requested

---

## Orders Edge Cases

- Customer has 0 orders → return []
- Customer has many orders → ensure performance
- Must not return another customer’s orders
- order_total must always be numeric and >= 0

---

## Date Filter Edge Cases (TC-005, TC-007, TC-008)

- from == to → single-day range
- from > to → reversed range
- missing from/to
- invalid date formats (01-10-2024, 2024/01/20)
- random strings

---

## Total Amount Edge Cases (TC-006, TC-009)

- min_total == max_total
- min_total > max_total
- negative totals
- non-numeric values
- decimals and rounding behavior

---

## General Response Format Rules

- empty responses → always []
- never return null
- correct data types:
  - customer_id → int
  - order_total → number
  - order_date → YYYY-MM-DD
- errors must be JSON objects
