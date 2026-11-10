{{ dbt_utils.deduplicate(
    relation=ref('customer_snapshot'),
    partition_by='customer_id',
    order_by='updated_at desc'
) }}