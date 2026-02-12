select
  fd.date_date as date,
  (fd.operational_margin - ic.ads_cost) as ads_margin,
  fd.average_basket,
  fd.operational_margin,
  ic.ads_cost,
  ic.impression as ads_impression,
  ic.click as ads_clicks,
  fd.quantity,
  fd.revenue,
  fd.purchase_cost,
  (fd.revenue - fd.purchase_cost) as margin,
  fd.shipping_fee,
  0 as log_cost,
  0 as ship_cost
from {{ ref('finance_days') }} fd
left join {{ ref('int_campaigns_day') }} ic
  on fd.date_date = ic.date_date
order by date desc