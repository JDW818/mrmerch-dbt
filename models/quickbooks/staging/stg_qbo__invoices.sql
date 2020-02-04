with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_invoices') }}
    
)

select 

    *,
    null as deliveryinfo__deliverytype,
    null as deliveryinfo__deliverytime,
    customerref as customerref__value,
    null as metadata__createtime,
    null as metadata__lastupdatedtime
    
from source