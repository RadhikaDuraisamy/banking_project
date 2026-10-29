
  create or replace   view BANKING_DW.DBT_DEV.stg_branches
  
  
  
  
  as (
    select BRANCH_ID,
upper(trim(BRANCH_NAME)) as BRANCH_NAME,
upper(trim(CITY)) as CITY
from BANKING_DW.RAW.BRANCHES
  );

