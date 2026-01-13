# Customers & Orders API — Manual QA Practice Project

This project is a manual QA testing practice setup. It uses a mock API created in Postman along with SQL validation. The goal is to show basic QA skills, including test planning, test cases, API testing, JSON validation, SQL checks, and defect logging.

This is meant to look like a realistic beginner-level QA portfolio project.

---

## 📌 What This Project Covers

- API contract (endpoints and expected behavior)
- Manual test plan
- Test cases (TC-001 through TC-010)
- Edge cases
- SQL validation queries
- Postman mock server setup
- Saved API responses as evidence
- Logged defects with explanations

Everything is written to be easy to understand and follow.

---

## 📁 Project Structure

```
/docs
  api_contract.md
  test_plan.md
  test_cases.md
  edge_cases.md
  defects.md

/sql
  validation_queries.sql

/evidence
  /response_samples
    TC-001-response.json
    TC-002-response.json
    ...
    TC-010-response.json

README.md
```

---

## 🧪 Testing Approach

### Tools Used
- **Postman** → API requests + mock server
- **SQL** → data validation and cross-checking expected results
- **GitHub** → documentation and version control

### Test Types
- Functional testing
- Negative testing
- Boundary value testing
- Error handling checks
- Data validation using SQL
- Response format validation

---

## ✔ Test Cases Completed

I created and executed test cases TC-001 through TC-010, including:

- Getting all customers
- Fetching customer by ID
- Handling invalid IDs
- Getting customer orders
- Date filtering
- Total amount filtering
- Invalid date format handling
- Reversed date ranges
- Non-numeric filter values
- Large dataset behavior

All test case results are saved under:

```
/evidence/response_samples
```

---

## ❗ Defects Found

I logged defects based on mismatches between the API contract and actual mock responses.

Defects included:

1. `customer_id` returned as a string instead of an integer  
2. `customer_name` returned in lowercase incorrectly  
3. An order below `min_total` appeared in filtered results  

Defects are documented in:

```
/docs/defects.md
```

---

## 💡 What I Learned

- How to build a mock API with Postman
- How to write a test plan and test cases
- How to validate API responses against SQL queries
- How to detect real API issues like:
  - Type mismatches
  - Missing fields
  - Incorrect filtering
- How to document defects clearly for developers
- How to organize a QA project in GitHub

---

## 📌 Notes

This is not a real backend — it’s a mock server.  
Responses are controlled manually, which is why some defects came from example JSON instead of backend logic.  
This is intentional so I can practice identifying issues.

---

## 🚀 Future Improvements (If Expanded)

If I extend this project, I may add:

- POST/PUT/DELETE endpoint testing
- Automated tests using Postman Collections
- More SQL joins and data consistency checks
- Performance testing using larger datasets
