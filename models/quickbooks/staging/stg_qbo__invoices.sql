with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_invoices') }}
    
)

select * from source