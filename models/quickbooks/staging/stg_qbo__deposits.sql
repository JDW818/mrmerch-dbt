with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_deposits') }}
    
)

select * from source