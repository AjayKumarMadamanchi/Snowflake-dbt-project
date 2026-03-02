SELECT ROOM_TYPE,
       CITY,
       COUNTRY,
       ACCOMMODATES,
       BEDROOMS,
       BATHROOMS,
       PRICE_PER_NIGHT,
       {{date_conversion_timezone('created_at','Asia/Kolkata')}}
 FROM {{ref('bronze_listings')}}