{% snapshot customer_snapshot %}

{{
    config(
        unique_key='CUSTOMER_ID',
        strategy='timestamp',
        updated_at='UPDATED_AT'
    )
}}

select *
from {{ source('RAW', 'CUSTOMERS') }}

{% endsnapshot %}