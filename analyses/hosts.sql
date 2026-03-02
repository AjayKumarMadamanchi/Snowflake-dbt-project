SELECT HOST_ID,
HOST_NAME,
HOST_SINCE,
IS_SUPERHOST,
RESPONSE_RATE,
{{date_conversion_timezone('created_at','Asia/Kolkata')}} as created_at

 FROM {{ref('bronze_hosts')}}