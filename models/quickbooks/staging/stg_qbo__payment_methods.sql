with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_paymentmethods') }}
    
)

select * from source