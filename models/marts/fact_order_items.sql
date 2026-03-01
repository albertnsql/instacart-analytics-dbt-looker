{{ config(
    materialized='incremental',
    unique_key=['order_id','product_id']
) }}

with order_items as (

    select
        op.order_id,
        op.product_id,
        op.reordered,
        1 as quantity
    from {{ ref('stg_order_products_prior') }} op

),

orders as (

    select
        order_id,
        customer_id,
        order_date
    from {{ ref('int_orders_enriched') }}

),

joined as (

    select
        oi.order_id,
        o.customer_id,
        oi.product_id,
        o.order_date,
        oi.reordered,
        oi.quantity,
        p.product_price as unit_price

    from order_items oi
    inner join orders o
        on oi.order_id = o.order_id
    left join {{ ref('dim_product') }} p
        on oi.product_id = p.product_id

),

calculated as (

    select
        order_id,
        customer_id,
        product_id,
        order_date,
        reordered,
        quantity,
        unit_price,

        quantity * unit_price as revenue,
        quantity * unit_price * 0.6 as cost,
        quantity * unit_price * 0.4 as margin

    from joined

)

select *
from calculated

{% if is_incremental() %}
where order_date > (select max(order_date) from {{ this }})
{% endif %}