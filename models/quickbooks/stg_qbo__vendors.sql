with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_vendors') }}
    
)

select * from source