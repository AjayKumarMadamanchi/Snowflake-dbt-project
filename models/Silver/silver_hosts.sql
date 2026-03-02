
{{
  config(
    materialized='incremental',
    unique_key='created_at',
    incremental_strategy='merge'
  )
}}
SELECT HOST_ID,
HOST_NAME,
HOST_SINCE,
IS_SUPERHOST,
RESPONSE_RATE,
{{date_conversion_timezone('created_at','Asia/Kolkata')}} as created_at

 FROM {{ref('bronze_hosts')}}

  
{% if is_incremental() %}
    where created_at > (
        select coalesce(max(created_at), '1900-01-01')
        from {{ this }}
    )
    {% endif %}