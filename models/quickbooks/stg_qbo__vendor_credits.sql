with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_vendorcredits') }}
    
)

select * from source