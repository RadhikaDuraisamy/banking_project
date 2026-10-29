select BRANCH_ID,
upper(trim(BRANCH_NAME)) as BRANCH_NAME,
upper(trim(CITY)) as CITY
from {{source('RAW','BRANCHES')}}