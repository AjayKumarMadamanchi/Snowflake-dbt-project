SELECT {{date_conversion_timezone('created_at')}} as created_at
FROM {{ref('bronze_bookings')}}