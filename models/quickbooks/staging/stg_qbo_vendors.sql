with source as (
    
    select * from {{ source('quickbooks', 'vendor') }}
    
),

renamed as (
    
    select
        
        id as vendor_id,
        displayname as vendor_name,
        balance as open_balance,
        vendor1099 as is_contractor

    from source
    
)

select * from renamed
