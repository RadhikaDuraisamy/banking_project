
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select branch_id
from BANKING_DW.DBT_DEV.int_transaction_details
where branch_id is null



  
  
      
    ) dbt_internal_test