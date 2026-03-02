{set config=[
    {
        'table': 'SNOWFLAKE_DBT.SILVER.SILVER_BOOKINGS',
        'columns':'*',
        'alias':'SILVER_BOOKINGS'
    },
    {
        'table': 'SNOWFLAKE_DBT.SILVER.LISTINGS',
        'columns':'*',
        'alias':'SILVER_LISTINGS'
        'JOIN': 'SILVER_BOOKINGS.LISTING = '
    },
    {
        'table': 'SNOWFLAKE_DBT.SILVER.HOSTS',
        'columns':'*',
        'alias':'SILVER_HOSTS'
    },
    
]}