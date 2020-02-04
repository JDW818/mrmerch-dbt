with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_accounts') }}
    
)

select 

    *,
    parentref as parentref__value,
    null as metadata__createtime,
    null as metadata__lastupdatedtime
    
from source