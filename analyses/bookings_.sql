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
ORDER BY booking_date
