
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        branch_id as value_field,
        count(*) as n_records

    from BANKING_DW.DBT_DEV.int_transaction_details
    group by branch_id

)

select *
from all_values
where value_field not in (
    'BR001','BR002','BR003','BR004','BR005'
)



  
  
      
    ) dbt_internal_test