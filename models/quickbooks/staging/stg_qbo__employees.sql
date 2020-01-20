with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_employees') }}
    
)

select * from source