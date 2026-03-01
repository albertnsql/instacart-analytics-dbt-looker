{{ config(
    materialized='table'
) }}

with order_items as (

    select *
    from {{ ref('fact_order_items') }}

),

aggregated as (

    select
        order_id,
        customer_id,
        order_date,

        sum(quantity) as total_items,
        count(distinct product_id) as unique_products,
        sum(revenue) as order_revenue,
        sum(cost) as order_cost,
        sum(margin) as order_margin,

        avg(unit_price) as avg_item_price,
        avg(reordered) as reorder_ratio

    from order_items
    group by
        order_id,
        customer_id,
        order_date

)

select *
from aggregated