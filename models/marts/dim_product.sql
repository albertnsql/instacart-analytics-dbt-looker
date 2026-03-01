{{ config(
    materialized='table'
) }}

select
    p.product_id,
    p.product_name,
    a.aisle_name,
    d.department_name,
    -- deterministic price (stable across rebuilds)
    2 + (p.product_id % 18) as product_price

from {{ ref('stg_products') }} p
left join {{ ref('stg_aisles') }} a
    on p.aisle_id = a.aisle_id
left join {{ ref('stg_departments') }} d
    on p.department_id = d.department_id