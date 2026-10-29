select CUSTOMER_ID,
upper(trim(CUSTOMER_NAME)) as CUSTOMER_NAME,
cast(DATE_OF_BIRTH as timestamp) as DATE_OF_BIRTH,
upper(trim(CITY)) as CITY,
cast(UPDATED_AT as timestamp) as UPDATED_AT 
from BANKING_DW.RAW.CUSTOMERS