with source as (
    
    select * from {{ source('quickbooks', 'item') }}
    
),

renamed as (
    
    select
        
        id as item_id,
        name as item_name,
        unitprice as unit_price,
        cast(incomeaccountref.value as int64) as income_account_id,
        incomeaccountref.name as income_account_name,
        metadata.CreateTime as created_at,
        metadata.LastUpdatedTime as updated_at
    
    from source
  
)

select * from renamed
