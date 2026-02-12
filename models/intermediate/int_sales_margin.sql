select 
    sales.date_date,
    sales.orders_id,
    sales.products_id,
    sales.quantity,
    sales.revenue,
    product.purchase_price,
    (CAST(sales.quantity AS INT64) * CAST(product.purchase_price AS FLOAT64)) AS purchase_cost,
    (CAST(sales.revenue AS FLOAT64) - (CAST(sales.quantity AS INT64) * CAST(product.purchase_price AS FLOAT64))) AS margin
from {{ref("stg_raw__sales")}} as sales
LEFT JOIN {{ref("stg_raw__product")}} as product
ON sales.products_id = product.products_id