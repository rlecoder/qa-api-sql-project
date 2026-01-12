------------------------------------------------------------
-- TC-001 — Get all customers
------------------------------------------------------------

SELECT 
    COUNT(*) AS expected_customer_count
FROM 
    customers;

SELECT 
    customer_id, 
    customer_name
FROM 
    customers;

------------------------------------------------------------
-- TC-002 — Get customer by ID
------------------------------------------------------------

SELECT 
    customer_id, 
    customer_name
FROM 
    customers
WHERE 
    customer_id = :customer_id;

------------------------------------------------------------
-- TC-003 — Get customer by INVALID ID (404 expected)
------------------------------------------------------------

SELECT 
    1
FROM 
    customers
WHERE 
    customer_id = :invalid_customer_id;

------------------------------------------------------------
-- TC-004 — Get all orders for a customer
------------------------------------------------------------

SELECT 
    order_id, 
    customer_id, 
    order_date, 
    order_total
FROM 
    orders
WHERE 
    customer_id = :customer_id;

------------------------------------------------------------
-- TC-005 — Get customer orders within a date range
------------------------------------------------------------

SELECT 
    order_id, 
    order_date, 
    order_total
FROM 
    orders
WHERE 
    customer_id = :customer_id
    AND order_date BETWEEN :from_date AND :to_date;

------------------------------------------------------------
-- TC-006 — Get orders filtered by order_total range
------------------------------------------------------------

SELECT 
    order_id, 
    customer_id, 
    order_total
FROM 
    orders
WHERE 
    order_total BETWEEN :min_total AND :max_total;

------------------------------------------------------------
-- TC-007 — Invalid date format (No SQL)
------------------------------------------------------------

-- Should never reach DB

------------------------------------------------------------
-- TC-008 — Reversed date range
------------------------------------------------------------

SELECT 
    order_id, 
    order_date
FROM 
    orders
WHERE 
    customer_id = :customer_id
  AND 
    order_date BETWEEN :from_date AND :to_date;

------------------------------------------------------------
-- TC-009 — Non-numeric totals (No SQL)
------------------------------------------------------------

-- Should never reach DB

------------------------------------------------------------
-- TC-010 — Large dataset performance
------------------------------------------------------------

SELECT
    order_id,
    customer_id,
    order_total
FROM
    orders
WHERE 
    order_total BETWEEN 0 AND 999999999;
