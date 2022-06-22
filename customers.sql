WITH
  orders AS 
    (SELECT 
      customer_id
      ,MIN(created_at)    AS first_order_datetime
      ,COUNT(id)          AS number_of_orders
    FROM analytics-engineers-club.coffee_shop.orders
    GROUP BY customer_id)

SELECT
  o.customer_id         AS customer_id
  ,c.name               AS customer_name
  ,c.email              AS customer_email
  ,o.first_order_datetime
  ,o.number_of_orders

FROM analytics-engineers-club.coffee_shop.customers AS c

LEFT OUTER JOIN orders AS o
  ON o.customer_id = c.id

ORDER BY 
  first_order_datetime