{{
  config(
    materialized='incremental',
    unique_key='created_at',
    incremental_strategy='merge'
  )
}}

SELECT booking_id,
        listing_id,
        booking_date,
        nights_booked,
        booking_amount,
        cleaning_fee,
        service_fee,
        {{total_booking_cost('nights_booked','booking_amount','cleaning_fee','service_fee')}} as total_booking_cost,
        booking_status,
        {{date_conversion_timezone('created_at','Asia/Kolkata')}} as created_at
FROM {{ref('bronze_bookings')}}

{% if is_incremental() %}
    where created_at > (
        select coalesce(max(created_at), '1900-01-01')
        from {{ this }}
    )
    {% endif %}
ORDER BY booking_dateq

