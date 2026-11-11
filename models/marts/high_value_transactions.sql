{{config(materialized='view')}}

select
transaction_key,
transaction_id,
    ACCOUNT_ID,
    TRANSACTION_TIMESTAMP,
    TRANSACTION_TYPE,
    TRANSACTION_CHANNEL,
    AMOUNT,
TRANSACTION_STATUS,
   UPDATED_AT
FROM {{ref('fact_transactions')}}
where amount>={{var('high_value_threshold',10000)}}