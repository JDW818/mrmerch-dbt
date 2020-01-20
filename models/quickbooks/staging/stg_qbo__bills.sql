with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_bills') }}
    
)

select * from source