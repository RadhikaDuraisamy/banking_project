{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='transaction_id',
        on_schema_change='sync_all_columns'   )
}}
select
{{dbt_utils.generate_surrogate_key(['transaction_id','ACCOUNT_ID'])}} as transaction_key,
transaction_id,
    ACCOUNT_ID,
    TRANSACTION_TIMESTAMP,
    TRANSACTION_TYPE,
    TRANSACTION_CHANNEL,
    AMOUNT,
TRANSACTION_STATUS,
   UPDATED_AT
FROM {{ref('stg_transactions')}}

{% if is_incremental() %} 
where UPDATED_AT>=
(select coalesce(max(UPDATED_AT),'1900-01-01'::timestamp) from {{this}} )
{% endif %}