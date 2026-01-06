# API + SQL QA Practice Project

## Overview
This project demonstrates manual API testing supported by SQL-based validation.
The goal is to simulate entry-level QA work validating API responses against a database source of truth.

## Scope
- Manual API testing (Postman-style)
- SQL validation of API responses
- Data integrity and edge-case analysis

Out of scope:
- Authentication
- Performance testing
- Automation

## API Under Test
Endpoints include:
- GET /v1/customers
- GET /v1/customers/{customer_id}
- GET /v1/customers/{customer_id}/orders
- GET /v1/orders?min_total&max_total

## Testing Approach
1. Define API contract and expected behavior
2. Write manual test cases before execution
3. Create SQL truth queries to validate API results
4. Execute API requests and compare results to SQL
5. Document defects and evidence

## SQL Validation
SQL queries are used as the source of truth to validate:
- data integrity (orphans, duplicates, missing fields)
- API filter logic (date ranges, total ranges)
- edge cases (zero values, invalid data)

See `sql/validation_queries.sql`.

## Edge Case Coverage
Common API risks were identified and documented prior to execution, including:
- invalid filter ranges
- missing parameters
- boundary values
- precision issues

## Tools
- SQL (PostgreSQL / ANSI SQL)
- Postman (manual API execution)
- GitHub (documentation and evidence)

## Status
- Test design complete
- SQL validation complete
- API execution pending
