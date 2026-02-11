WITH orders_per_day AS (

  SELECT
    date_date,

    COUNT(DISTINCT orders_id) AS nb_transactions,
    SUM(revenue) AS revenue,
    SUM(quantity) AS quantity,
    SUM(purchase_cost) AS purchase_cost,
    SUM(shipping_fee) AS shipping_fee,
    SUM(logcost) AS logcost,
    SUM(ship_cost) AS ship_cost,
    SUM(operational_margin) AS operational_margin

  FROM {{ ref('int_orders_operational') }}

  GROUP BY date_date
)

SELECT
  date_date,

  nb_transactions,

  ROUND(revenue, 2) AS revenue,

  ROUND(revenue / nb_transactions, 2) AS average_basket,

  ROUND(operational_margin, 2) AS operational_margin,

  ROUND(purchase_cost, 2) AS purchase_cost,

  ROUND(shipping_fee, 2) AS shipping_fee,

  ROUND(logcost, 2) AS logcost,

  quantity

FROM orders_per_day

ORDER BY date_date