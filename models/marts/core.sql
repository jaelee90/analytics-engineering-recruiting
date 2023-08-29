with merchants as (
    select
          shop_id
        , benchmark_vertical
    from {{ ref('stg__merchants') }}
),

orders as (
    select
          order_id
        , order_created_at
        , shop_id
        , line_item_count
        , gross_merchandise_value_usd
    from {{ ref('stg__orders') }}
),

returns as (
    select
          order_id
        , gift_cards_enabled
        , instant_exchange_enabled
        , refunds_enabled
        , keep_item_threshold
    from {{ ref('stg__returns') }}
),

final as (
    select
          {{ dbt_utils.generate_surrogate_key(['orders.order_id', 'merchants.shop_id']) }} as return_order_primary_key
        , orders.order_id
        , merchants.shop_id
        , line_item_count
        , gross_merchandise_value_usd
        , benchmark_vertical
        , gift_cards_enabled
        , instant_exchange_enabled
        , refunds_enabled
        , keep_item_threshold
        , order_created_at
    from orders
    left join returns
        on orders.order_id = returns.order_id
    left join merchants
        on orders.shop_id = merchants.shop_id
)

select * from final