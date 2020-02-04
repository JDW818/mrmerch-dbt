with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_items') }}
    
)

select 

    *

from source