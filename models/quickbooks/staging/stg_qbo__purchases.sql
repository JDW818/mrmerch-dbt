with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_purchases') }}
    
)

select * from source