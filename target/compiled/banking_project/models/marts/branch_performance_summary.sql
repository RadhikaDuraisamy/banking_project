select BRANCH_ID,
BRANCH_NAME,
city,
count(distinct TRANSACTION_ID) as Total_Transaction_Count,
count(distinct ACCOUNT_ID) as Total_Account_Count,
count(distinct CUSTOMER_ID) as Total_Customer_Count,
sum(
    case when TRANSACTION_STATUS ='SUCCESS' then 1
    else 0
    end
) as Success_Transaction_Count,
sum(
    case when TRANSACTION_STATUS ='FAILURE' then 1
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
BRANCH_ID,
BRANCH_NAME,
city