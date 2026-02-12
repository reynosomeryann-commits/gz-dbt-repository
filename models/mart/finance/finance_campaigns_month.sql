with source as (

  select
    date,
    ads_margin,
    average_basket,
    operational_margin,
    ads_cost,
    ads_impression,
    ads_clicks,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    log_cost,
    ship_cost
  from {{ ref('finance_campaigns_day') }}

),

monthly as (

  select
    -- month key
    date_trunc(date, month) as datemonth,

    -- metrics
    sum(ads_margin) as ads_margin,
    avg(average_basket) as average_basket,
    sum(operational_margin) as operational_margin,
    sum(ads_cost) as ads_cost,
    sum(ads_impression) as ads_impression,
    sum(ads_clicks) as ads_clicks,
    sum(quantity) as quantity,
    sum(revenue) as revenue,
    sum(purchase_cost) as purchase_cost,
    sum(margin) as margin,
    sum(shipping_fee) as shipping_fee,
    sum(log_cost) as log_cost,
    sum(ship_cost) as ship_cost

  from source
  group by 1
)

select *
from monthly
order by datemonth desc