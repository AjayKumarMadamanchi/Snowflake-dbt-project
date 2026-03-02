{{
  config(
    materialized='incremental',
    unique_key='created_at',
    incremental_strategy='merge'
  )
}}
SELECT LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    CITY,
    COUNTRY,
    ACCOMMODATES,
    BEDROOMS,
    BATHROOMS,
    PRICE_PER_NIGHT,
       {{date_conversion_timezone('created_at','Asia/Kolkata')}} as created_at
 FROM {{ref('bronze_listings')}}

 
{% if is_incremental() %}
    where created_at > (
        select coalesce(max(created_at), '1900-01-01')
        from {{ this }}
    )
    {% endif %}