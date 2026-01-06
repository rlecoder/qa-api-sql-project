/* =========================================================
   Problem A — Orphan Orders
   Orders whose customer_id does not exist in customers
   ========================================================= */

SELECT
  o.order_id
FROM orders o
LEFT JOIN customers c
  ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


/* =========================================================
   Problem B — Negative Order Totals
   Orders with invalid negative monetary values
   ========================================================= */

SELECT
  order_id,
  customer_id,
  order_date,
  order_total
FROM orders
WHERE order_total < 0;


/* =========================================================
   Problem C — Zero-Dollar Orders
   Orders with total equal to zero (edge-case review)
   ========================================================= */

SELECT
  order_id,
  customer_id,
  order_date,
  order_total
FROM orders
WHERE order_total = 0;


/* =========================================================
   Problem D — Missing Required Fields
   Orders missing required data
   ========================================================= */

SELECT *
FROM orders
WHERE customer_id IS NULL
   OR order_date IS NULL
   OR order_total IS NULL;


/* =========================================================
   Problem E — Duplicate Primary Keys
   ========================================================= */

/* Duplicate customer IDs */
SELECT
  c.customer_id,
  COUNT(*) AS dup_count
FROM customers c
GROUP BY c.customer_id
HAVING COUNT(*) > 1;

/* Duplicate order IDs */
SELECT
  o.order_id,
  COUNT(*) AS dup_count
FROM orders o
GROUP BY o.order_id
HAVING COUNT(*) > 1;


/* =========================================================
   Problem F — Customers With No Orders
   Customers who have never placed an order
   ========================================================= */

SELECT
  c.customer_id,
  c.customer_name
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


/* =========================================================
   Problem G — Date Filter Truth Set
   Supports: GET /v1/customers/{customer_id}/orders?from&to
   ========================================================= */

SELECT
  order_id,
  customer_id,
  order_date,
  order_total
FROM orders
WHERE customer_id = :customer_id
  AND order_date BETWEEN :from_date AND :to_date
ORDER BY order_date, order_id;


/* =========================================================
   Problem H — Total Filter Truth Set
   Supports: GET /v1/orders?min_total&max_total
   ========================================================= */

SELECT
  customer_id,
  order_id,
  order_date,
  order_total
FROM orders
WHERE order_total BETWEEN :min_total AND :max_total
ORDER BY order_total, order_id;

