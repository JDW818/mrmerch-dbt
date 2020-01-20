with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_billpayments') }}
    
)

select * from source