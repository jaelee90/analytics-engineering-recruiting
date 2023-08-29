with source_data as (
    select *
    from {{ ref('orders') }}
)

select
    order_id
  , provider_id
  , order_created_at
  , IFNULL(fulfillment_status, 'other') as fulfillment_status
  , line_item_count
  , order_processed_at
  , IFNULL(processing_method, 'other') as processing_method
  , shop_id
  , IFNULL(source_name, 'other') as source_name
  , sales_channel
  , gross_merchandise_value_usd
from source_data
