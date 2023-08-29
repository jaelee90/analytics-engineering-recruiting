with source_data as (
    select *
    from {{ ref('returns') }}
)

select
    return_id
  , return_created_at
  , IFNULL(destination_id, -1) as destination_id
  , item_count
  , is_gift_return
  , is_in_store_return
  , order_id
  , provider_id
  , return_policy
  , IFNULL(return_processed_at, '9999-12-31 23:59:59 UTC') as return_processed_at
  , return_state
  , shop_id
  , refund_value_usd
  , exchange_value_usd
  , return_price_usd
  , total_shop_currency
from source_data
