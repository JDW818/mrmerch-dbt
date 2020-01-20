with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_payments') }}
    
)

select * from source