/* Query 1: Total order volume */

SELECT COUNT(*) AS total_orders
FROM `bigquery-public-data.thelook_ecommerce.orders`;

/* Query 2: Unique purchasing users */

SELECT COUNT(DISTINCT user_id) AS purchasing_users
FROM `bigquery-public-data.thelook_ecommerce.orders`;


/* Query 3: User acquisition source distribution */

SELECT
  traffic_source,
  COUNT(*) AS users
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY traffic_source
ORDER BY users DESC;

/* Query 4: Monthly retention rate */

WITH first_orders AS (
SELECT
user_id,
MIN(DATE(created_at)) AS first_order_date
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY user_id
),

user_orders AS (
SELECT
o.user_id,
DATE_DIFF(
DATE(o.created_at),
f.first_order_date,
MONTH
) AS cohort_month
FROM `bigquery-public-data.thelook_ecommerce.orders` o
JOIN first_orders f
ON o.user_id = f.user_id
),

retention_counts AS (
SELECT
cohort_month,
COUNT(DISTINCT user_id) AS retained_users
FROM user_orders
GROUP BY cohort_month
)

SELECT
cohort_month,
retained_users,
ROUND(
retained_users * 100.0 /
FIRST_VALUE(retained_users) OVER (
ORDER BY cohort_month
),
2
) AS retention_rate
FROM retention_counts
ORDER BY cohort_month;


/* Query 5: Monthly Retention by Acquisition Channel */

WITH first_orders AS (
  SELECT
    o.user_id,
    u.traffic_source,
    MIN(DATE(o.created_at)) AS first_order_date
  FROM `bigquery-public-data.thelook_ecommerce.orders` o
  JOIN `bigquery-public-data.thelook_ecommerce.users` u
    ON o.user_id = u.id
  GROUP BY o.user_id, u.traffic_source
),

user_orders AS (
  SELECT
    o.user_id,
    f.traffic_source,
    DATE_DIFF(
      DATE(o.created_at),
      f.first_order_date,
      MONTH
    ) AS cohort_month
  FROM `bigquery-public-data.thelook_ecommerce.orders` o
  JOIN first_orders f
    ON o.user_id = f.user_id
),

retention_counts AS (
  SELECT
    traffic_source,
    cohort_month,
    COUNT(DISTINCT user_id) AS retained_users
  FROM user_orders
  GROUP BY traffic_source, cohort_month
)

SELECT
  traffic_source,
  cohort_month,
  retained_users,
  ROUND(
    retained_users * 100.0 /
    FIRST_VALUE(retained_users)
      OVER (
        PARTITION BY traffic_source
        ORDER BY cohort_month
      ),
    2
  ) AS retention_rate
FROM retention_counts
ORDER BY traffic_source, cohort_month;

/* Query 6 : Repeat Purchase Segmentation*/

WITH user_order_counts AS (
SELECT
user_id,
COUNT(order_id) AS total_orders
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY user_id
)

SELECT
CASE
WHEN total_orders = 1 THEN 'One-time buyers'
WHEN total_orders BETWEEN 2 AND 3 THEN 'Low repeat users'
WHEN total_orders BETWEEN 4 AND 6 THEN 'Regular customers'
ELSE 'Power users'
END AS user_segment,
COUNT(*) AS users
FROM user_order_counts
GROUP BY user_segment
ORDER BY users DESC;

/* Query 7: Lifecycle intervention opportunities*/

WITH first_orders AS (
  SELECT
    user_id,
    MIN(DATE(created_at)) AS first_order_date
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  GROUP BY user_id
),

repeat_orders AS (
  SELECT
    o.user_id,
    DATE_DIFF(
      DATE(o.created_at),
      f.first_order_date,
      DAY
    ) AS days_to_repeat
  FROM `bigquery-public-data.thelook_ecommerce.orders` o
  JOIN first_orders f
    ON o.user_id = f.user_id
  WHERE DATE(o.created_at) > f.first_order_date
)

SELECT
  CASE
    WHEN days_to_repeat <= 7 THEN '0–7 Days'
    WHEN days_to_repeat <= 30 THEN '8–30 Days'
    WHEN days_to_repeat <= 60 THEN '31–60 Days'
    WHEN days_to_repeat <= 90 THEN '61–90 Days'
    ELSE '90+ Days'
  END AS repeat_window,
  COUNT(DISTINCT user_id) AS users
FROM repeat_orders
GROUP BY repeat_window
ORDER BY users DESC;

/* Query 8: RFM Customer Segmentation /

WITH customer_metrics AS (
  SELECT
    user_id,
    COUNT(order_id) AS frequency,
    MAX(DATE(created_at)) AS last_order_date,
    DATE_DIFF(
      CURRENT_DATE(),
      MAX(DATE(created_at)),
      DAY
    ) AS recency
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  GROUP BY user_id
)

SELECT
  CASE
    WHEN recency <= 30 AND frequency >= 3 THEN 'Champions'
    WHEN recency <= 60 AND frequency >= 2 THEN 'Loyal Customers'
    WHEN recency <= 90 AND frequency = 1 THEN 'Recent Buyers'
    ELSE 'At Risk'
  END AS customer_segment,
  COUNT(*) AS users
FROM customer_metrics
GROUP BY customer_segment
ORDER BY users DESC;

