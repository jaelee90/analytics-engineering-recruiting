with source_data as (
    select *
    from {{ ref('merchants') }}
)

select
    shop_id
  , merchant_created_at
  , merchant_currency
  , is_portal_active
  , provider_id
  , merchant_updated_at
  , merchant_currency_symbol
  , IFNULL(benchmark_vertical, 'N/A') as benchmark_vertical
  , IFNULL(msm_market_segment, 'N/A') as msm_market_segment
from source_data
