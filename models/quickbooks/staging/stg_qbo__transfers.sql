with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_transfers') }}
    
)

select * from source