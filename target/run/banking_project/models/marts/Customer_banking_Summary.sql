
  
    



create or replace transient  table BANKING_DW.DBT_DEV.Customer_banking_Summary
    
    
    
    
    as (with transaction_summary as
(
    select CUSTOMER_ID,
    CUSTOMER_NAME,
    CITY,
    count(distinct account_id) as total_account_count,
    count(TRANSACTION_ID) as total_transaction_count,
    sum(
    case when TRANSACTION_STATUS ='SUCCESS' then 1
    else 0
    end
) as Success_Transaction_Count,
sum(
    case when TRANSACTION_STATUS ='FAILED' then 1
    else 0
    end
) as Failure_Transaction_Count,
sum(
    case when TRANSACTION_STATUS ='SUCCESS' then AMOUNT
    else 0
    end
) as Success_Transaction_Amount,
avg(
    case when TRANSACTION_STATUS ='SUCCESS' then AMOUNT
    else 0
    end
) as Avg_Success_Transaction_Amount
from BANKING_DW.DBT_DEV.int_transaction_details
group by 
CUSTOMER_ID,
    CUSTOMER_NAME,
    CITY
),
loan_summary as (
    select CUSTOMER_ID,
    count(distinct LOAN_ID) as loan_count,
    sum(case when LOAN_STATUS='ACTIVE' then 1 else 0 end)  as active_loan_count,
    sum(PRINCIPAL_AMOUNT) as TOTAL_PRINCIPAL_AMOUNT,
      sum(MONTHLY_EMI) as TOTAL_MONTHLY_EMI,
avg(INTEREST_RATE) as avg_intrest_rate
from BANKING_DW.DBT_DEV.stg_loans
group by 
CUSTOMER_ID
)
select
t.CUSTOMER_ID,
    CUSTOMER_NAME,
    CITY,
total_account_count,
total_transaction_count,
Success_Transaction_Count,
Failure_Transaction_Count,
Success_Transaction_Amount,
Avg_Success_Transaction_Amount,
loan_count,
active_loan_count,
TOTAL_PRINCIPAL_AMOUNT,
TOTAL_MONTHLY_EMI
avg_intrest_rate
from transaction_summary t left join loan_summary l on 
t.CUSTOMER_ID=l.CUSTOMER_ID
    )
;



  