
  
    



create or replace transient  table BANKING_DW.DBT_DEV.int_transaction_details
    
    
    
    
    as (

select 
    t.TRANSACTION_ID,
    t.ACCOUNT_ID,
    t.TRANSACTION_TIMESTAMP,
    t.TRANSACTION_TYPE,
    t.TRANSACTION_CHANNEL,
    t.AMOUNT,
    t.TRANSACTION_STATUS,
   a.ACCOUNT_TYPE,
    a.OPENED_DATE,
    a.ACCOUNT_STATUS,
    a.OPENING_BALANCE,
    b.BRANCH_ID,
b.BRANCH_NAME,
c.CUSTOMER_ID,
c.CUSTOMER_NAME,
c.DATE_OF_BIRTH,
c.CITY 
from BANKING_DW.DBT_DEV.stg_transactions t  inner join BANKING_DW.DBT_DEV.stg_accounts a
ON t.ACCOUNT_ID=a.ACCOUNT_ID 
inner join BANKING_DW.DBT_DEV.stg_customers c 
on a.CUSTOMER_ID=c.CUSTOMER_ID
left join  BANKING_DW.DBT_DEV.stg_branches b 
ON a.BRANCH_ID=b.BRANCH_ID
    )
;



  