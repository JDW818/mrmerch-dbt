with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_classes') }}
    
)

select 

    *,
    null as parentref__value,
    null as metadata__createtime,
    null as metadata__lastupdatedtime
    
from source