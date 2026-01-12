# Test Plan — Customers & Orders API (v1)

This test plan explains how I am testing the Customers & Orders API using Postman and SQL. The goal is to confirm that the API returns correct data, handles invalid inputs properly, and follows a consistent JSON format. A Postman mock server is used to simulate responses.

---

## 1. Objective

The purpose of this testing is to verify that:
- Customer and order data is returned correctly
- API endpoints behave as described in the contract
- Date and total amount filtering works
- Invalid inputs return proper error responses
- SQL validation matches expected API results
- Responses follow the correct JSON structure

---

## 2. Scope

The test plan covers TC-001 through TC-010:

- TC-001: Get all customers
- TC-002: Get customer by valid ID
- TC-003: Handle invalid customer ID
- TC-004: Get orders for a customer
- TC-005: Filter orders by date range
- TC-006: Filter orders by total amount
- TC-007: Invalid date formats
- TC-008: Reversed date ranges
- TC-009: Non-numeric filter values
- TC-010: Large dataset / performance behavior

Out of scope:
- POST/PUT/DELETE methods
- Authentication
- Pagination
- UI testing
- True load/performance testing

---

## 3. Test Environment

Tools used:
- **Postman** for API calls and mock server
- **GitHub** for documentation
- **SQL** for backend data validation

All responses come from the Postman mock server, not a real database.

---

## 4. Test Data

Test data is basic and created for practice:

**Customers**
- ID 1 — Alice
- ID 2 — Bob

**Orders**
- Valid totals (positive integers)
- Valid dates (YYYY-MM-DD)
- Some invalid samples for negative testing

All sample data is stored as “Examples” in Postman.

---

## 5. Test Types

This project uses:
- Functional testing
- Negative testing
- Boundary value testing
- Data validation testing
- Error handling verification
- SQL comparison

---

## 6. Test Case Reference

All test cases are documented in:

docs/test_cases.md


Each test case includes:
- Endpoint
- Parameters
- Expected results
- SQL validation

---

## 7. Entry Criteria

Testing begins when:
- The API contract is complete
- Test cases are written
- Mock server is configured
- JSON examples exist

---

## 8. Exit Criteria

Testing is complete when:
- TC-001 through TC-010 are executed
- Responses saved in `/evidence/response_samples`
- SQL validation matches the API output
- All defects are logged
- No major issues remain unresolved

---

## 9. Risks and Assumptions

**Risks**
- Mock server may not behave like a real backend
- Some invalid input behavior may not be simulated correctly

**Assumptions**
- Mock data remains unchanged
- API follows the defined contract

---

## 10. Deliverables

This project includes:
- Test plan
- Test cases
- Edge cases
- SQL validation queries
- Postman mock server
- Saved API responses
- Defects log
