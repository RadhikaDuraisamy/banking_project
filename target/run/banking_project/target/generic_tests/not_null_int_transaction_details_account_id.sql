
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select account_id
from BANKING_DW.DBT_DEV.int_transaction_details
where account_id is null



  
  
      
    ) dbt_internal_test