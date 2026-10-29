
    
    

select
    transaction_id as unique_field,
    count(*) as n_records

from BANKING_DW.DBT_DEV.int_transaction_details
where transaction_id is not null
group by transaction_id
having count(*) > 1


