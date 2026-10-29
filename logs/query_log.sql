-- created_at: 2026-10-29T08:22:40.600725+00:00
-- finished_at: 2026-10-29T08:22:40.937785800+00:00
-- elapsed: 337ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c80cd6-000e-200a-0002-9d0e001db1de
-- desc: execute adapter call
show terse schemas in database BANKING_DW
    limit 10000
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:41.057054400+00:00
-- finished_at: 2026-10-29T08:22:41.530193700+00:00
-- elapsed: 473ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.samples
-- query_id: 01c80cd6-000e-1fcd-0002-9d0e001fa032
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "BANKING_DW"."DBT_DEV" LIMIT 10000;

-- created_at: 2026-10-29T08:22:41.838901300+00:00
-- finished_at: 2026-10-29T08:22:42.470084300+00:00
-- elapsed: 631ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.stg_customers
-- query_id: 01c80cd6-000e-212d-0002-9d0e001f7076
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "BANKING_DW"."DBT_DEV" LIMIT 10000;

-- created_at: 2026-10-29T08:22:42.263205600+00:00
-- finished_at: 2026-10-29T08:22:42.758458800+00:00
-- elapsed: 495ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.stg_accounts
-- query_id: 01c80cd6-000e-1fae-0002-9d0e001c60e6
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "BANKING_DW"."DBT_DEV" LIMIT 10000;

-- created_at: 2026-10-29T08:22:41.551674300+00:00
-- finished_at: 2026-10-29T08:22:42.765788100+00:00
-- elapsed: 1.2s
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.samples
-- query_id: 01c80cd6-000e-20f3-0002-9d0e001ef0fe
-- desc: execute adapter call
create or replace transient  table BANKING_DW.DBT_DEV.samples
    
    
    
    
    as (select * from BANKING_DW.DBT_DEV.BRANCH_PERFORMANCE_SUMMARY
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.samples", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:42.658677200+00:00
-- finished_at: 2026-10-29T08:22:42.878535400+00:00
-- elapsed: 219ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.stg_loans
-- query_id: 01c80cd6-000e-212d-0002-9d0e001f707a
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "BANKING_DW"."DBT_DEV" LIMIT 10000;

-- created_at: 2026-10-29T08:22:42.717292+00:00
-- finished_at: 2026-10-29T08:22:42.898679700+00:00
-- elapsed: 181ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.stg_branches
-- query_id: 01c80cd6-000e-20f3-0002-9d0e001ef102
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "BANKING_DW"."DBT_DEV" LIMIT 10000;

-- created_at: 2026-10-29T08:22:42.433191300+00:00
-- finished_at: 2026-10-29T08:22:43.018882200+00:00
-- elapsed: 585ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.stg_transactions
-- query_id: 01c80cd6-000e-1fae-0002-9d0e001c60ea
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "BANKING_DW"."DBT_DEV" LIMIT 10000;

-- created_at: 2026-10-29T08:22:42.476815400+00:00
-- finished_at: 2026-10-29T08:22:43.086911400+00:00
-- elapsed: 610ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.stg_customers
-- query_id: 01c80cd6-000e-1fa1-0002-9d0e001c40ce
-- desc: execute adapter call
create or replace   view BANKING_DW.DBT_DEV.stg_customers
  
  
  
  
  as (
    select CUSTOMER_ID,
upper(trim(CUSTOMER_NAME)) as CUSTOMER_NAME,
cast(DATE_OF_BIRTH as timestamp) as DATE_OF_BIRTH,
upper(trim(CITY)) as CITY,
cast(UPDATED_AT as timestamp) as UPDATED_AT 
from BANKING_DW.RAW.CUSTOMERS
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.stg_customers", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:42.884664+00:00
-- finished_at: 2026-10-29T08:22:43.182330500+00:00
-- elapsed: 297ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.stg_loans
-- query_id: 01c80cd6-000e-1fa1-0002-9d0e001c40d2
-- desc: execute adapter call
create or replace   view BANKING_DW.DBT_DEV.stg_loans
  
  
  
  
  as (
    SELECT
    LOAN_ID,
    CUSTOMER_ID,
    UPPER(TRIM(LOAN_TYPE)) AS LOAN_TYPE,
    PRINCIPAL_AMOUNT,
    INTEREST_RATE,
    DISBURSEMENT_DATE,
    UPPER(TRIM(LOAN_STATUS)) AS LOAN_STATUS,
    MONTHLY_EMI,
    TO_TIMESTAMP_NTZ(UPDATED_AT) AS UPDATED_AT
FROM BANKING_DW.RAW.LOANS
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.stg_loans", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:42.905556500+00:00
-- finished_at: 2026-10-29T08:22:43.213301+00:00
-- elapsed: 307ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.stg_branches
-- query_id: 01c80cd6-000e-200a-0002-9d0e001db1e2
-- desc: execute adapter call
create or replace   view BANKING_DW.DBT_DEV.stg_branches
  
  
  
  
  as (
    select BRANCH_ID,
upper(trim(BRANCH_NAME)) as BRANCH_NAME,
upper(trim(CITY)) as CITY
from BANKING_DW.RAW.BRANCHES
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.stg_branches", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:42.768264800+00:00
-- finished_at: 2026-10-29T08:22:43.486219900+00:00
-- elapsed: 717ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.stg_accounts
-- query_id: 01c80cd6-000e-1f9d-0002-9d0e001c3562
-- desc: execute adapter call
create or replace   view BANKING_DW.DBT_DEV.stg_accounts
  
  
  
  
  as (
    SELECT
    ACCOUNT_ID,
    CUSTOMER_ID,
    BRANCH_ID,
    UPPER(TRIM(ACCOUNT_TYPE)) AS ACCOUNT_TYPE,
    OPENED_DATE,
    UPPER(TRIM(ACCOUNT_STATUS)) AS ACCOUNT_STATUS,
    OPENING_BALANCE,
    TO_TIMESTAMP_NTZ(UPDATED_AT) AS UPDATED_AT
FROM BANKING_DW.RAW.ACCOUNTS
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.stg_accounts", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:43.024551500+00:00
-- finished_at: 2026-10-29T08:22:44.722271300+00:00
-- elapsed: 1.7s
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.stg_transactions
-- query_id: 01c80cd6-000e-211f-0002-9d0e0020201e
-- desc: execute adapter call
create or replace   view BANKING_DW.DBT_DEV.stg_transactions
  
  
  
  
  as (
    SELECT
    TRANSACTION_ID,
    ACCOUNT_ID,
    TO_TIMESTAMP_NTZ(TRANSACTION_TIMESTAMP) AS TRANSACTION_TIMESTAMP,
    UPPER(TRIM(TRANSACTION_TYPE)) AS TRANSACTION_TYPE,
    UPPER(TRIM(TRANSACTION_CHANNEL)) AS TRANSACTION_CHANNEL,
    AMOUNT,
    UPPER(TRIM(TRANSACTION_STATUS)) AS TRANSACTION_STATUS,
    TO_TIMESTAMP_NTZ(UPDATED_AT) AS UPDATED_AT
FROM BANKING_DW.RAW.TRANSACTIONS
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.stg_transactions", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:44.749336100+00:00
-- finished_at: 2026-10-29T08:22:45.321586800+00:00
-- elapsed: 572ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.fact_transactions
-- query_id: 01c80cd6-000e-2161-0002-9d0e001fd06e
-- desc: execute adapter call
create or replace  temporary view BANKING_DW.DBT_DEV.fact_transactions__dbt_tmp
  
  
  
  
  as (
    
select
  TRANSACTION_ID,
    ACCOUNT_ID,
    TRANSACTION_TIMESTAMP,
    TRANSACTION_TYPE,
    TRANSACTION_CHANNEL,
    AMOUNT,
TRANSACTION_STATUS,
   UPDATED_AT
FROM BANKING_DW.DBT_DEV.stg_transactions

 
where UPDATED_AT>=
(select coalesce(max(UPDATED_AT),'1900-01-01'::timestamp) from BANKING_DW.DBT_DEV.fact_transactions )

  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.fact_transactions", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:45.345008100+00:00
-- finished_at: 2026-10-29T08:22:45.556831700+00:00
-- elapsed: 211ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.fact_transactions
-- query_id: 01c80cd6-000e-1fae-0002-9d0e001c60ee
-- desc: execute adapter call
describe table BANKING_DW.DBT_DEV.fact_transactions__dbt_tmp
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.fact_transactions", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:45.594779+00:00
-- finished_at: 2026-10-29T08:22:46.203307+00:00
-- elapsed: 608ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.fact_transactions
-- query_id: 01c80cd6-000e-216b-0002-9d0e001fc04a
-- desc: execute adapter call
describe table BANKING_DW.DBT_DEV.fact_transactions
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.fact_transactions", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:46.209091300+00:00
-- finished_at: 2026-10-29T08:22:46.414333400+00:00
-- elapsed: 205ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.fact_transactions
-- query_id: 01c80cd6-000e-1f4e-0002-9d0e001f47ae
-- desc: execute adapter call
describe table "BANKING_DW"."DBT_DEV"."FACT_TRANSACTIONS"
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.fact_transactions", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:44.745224300+00:00
-- finished_at: 2026-10-29T08:22:46.579813500+00:00
-- elapsed: 1.8s
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.int_transaction_details
-- query_id: 01c80cd6-000e-1f4e-0002-9d0e001f47aa
-- desc: execute adapter call
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

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.int_transaction_details", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:46.434598+00:00
-- finished_at: 2026-10-29T08:22:46.765542100+00:00
-- elapsed: 330ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.fact_transactions
-- query_id: 01c80cd6-000e-21b9-0002-9d0e0020301a
-- desc: execute adapter call
-- back compat for old kwarg name
  
  begin
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.fact_transactions", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:46.622861900+00:00
-- finished_at: 2026-10-29T08:22:47.268575700+00:00
-- elapsed: 645ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.branch_performance_summary
-- query_id: 01c80cd6-000e-20f3-0002-9d0e001ef106
-- desc: execute adapter call
create or replace transient  table BANKING_DW.DBT_DEV.branch_performance_summary
    
    
    
    
    as (select BRANCH_ID,
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
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.branch_performance_summary", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:46.622716200+00:00
-- finished_at: 2026-10-29T08:22:47.787697700+00:00
-- elapsed: 1.2s
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.Customer_banking_Summary
-- query_id: 01c80cd6-000e-1fcd-0002-9d0e001fa036
-- desc: execute adapter call
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

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.Customer_banking_Summary", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:46.765907700+00:00
-- finished_at: 2026-10-29T08:22:47.850529400+00:00
-- elapsed: 1.1s
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.fact_transactions
-- query_id: 01c80cd6-000e-212d-0002-9d0e001f707e
-- desc: execute adapter call

    
        
            
            
            
            
        
    

    

    merge into BANKING_DW.DBT_DEV.fact_transactions as DBT_INTERNAL_DEST
        using BANKING_DW.DBT_DEV.fact_transactions__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.transaction_id = DBT_INTERNAL_DEST.transaction_id))

    
    when matched then update set
        "TRANSACTION_ID" = DBT_INTERNAL_SOURCE."TRANSACTION_ID","ACCOUNT_ID" = DBT_INTERNAL_SOURCE."ACCOUNT_ID","TRANSACTION_TIMESTAMP" = DBT_INTERNAL_SOURCE."TRANSACTION_TIMESTAMP","TRANSACTION_TYPE" = DBT_INTERNAL_SOURCE."TRANSACTION_TYPE","TRANSACTION_CHANNEL" = DBT_INTERNAL_SOURCE."TRANSACTION_CHANNEL","AMOUNT" = DBT_INTERNAL_SOURCE."AMOUNT","TRANSACTION_STATUS" = DBT_INTERNAL_SOURCE."TRANSACTION_STATUS","UPDATED_AT" = DBT_INTERNAL_SOURCE."UPDATED_AT"
    

    when not matched then insert
        ("TRANSACTION_ID", "ACCOUNT_ID", "TRANSACTION_TIMESTAMP", "TRANSACTION_TYPE", "TRANSACTION_CHANNEL", "AMOUNT", "TRANSACTION_STATUS", "UPDATED_AT")
    values
        ("TRANSACTION_ID", "ACCOUNT_ID", "TRANSACTION_TIMESTAMP", "TRANSACTION_TYPE", "TRANSACTION_CHANNEL", "AMOUNT", "TRANSACTION_STATUS", "UPDATED_AT")


/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.fact_transactions", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:47.850981300+00:00
-- finished_at: 2026-10-29T08:22:48.183363600+00:00
-- elapsed: 332ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.fact_transactions
-- query_id: 01c80cd6-000e-1f9d-0002-9d0e001c3566
-- desc: execute adapter call

    commit
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.fact_transactions", "profile_name": "banking_project", "target_name": "dev"} */;

-- created_at: 2026-10-29T08:22:48.187890300+00:00
-- finished_at: 2026-10-29T08:22:48.432948200+00:00
-- elapsed: 245ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.banking_project.fact_transactions
-- query_id: 01c80cd6-000e-1fae-0002-9d0e001c60f2
-- desc: execute adapter call
drop view if exists BANKING_DW.DBT_DEV.fact_transactions__dbt_tmp cascade
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.banking_project.fact_transactions", "profile_name": "banking_project", "target_name": "dev"} */;

