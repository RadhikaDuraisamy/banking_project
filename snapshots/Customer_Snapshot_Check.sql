{% snapshot customer_snapshot_check %}

{{
    config(
        unique_key='CUSTOMER_ID',
        strategy='check',
        check_cols=['CUSTOMER_NAME','DATE_OF_BIRTH','CITY'],
        invalidate_hard_deletes=TRUE
    )
}}

select *
from {{ source('RAW', 'CUSTOMERS') }}

{% endsnapshot %}