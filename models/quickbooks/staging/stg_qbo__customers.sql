with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_customers') }}
    
)

select * from source