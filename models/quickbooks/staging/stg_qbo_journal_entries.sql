with source as (
    
    select * from {{ source('quickbooks', 'journal_entry') }}
    
),

renamed as (
    
    select
        
        id as journal_entry_id,
        cast(txndate as date) as txn_date,
        adjustment,
        metadata.CreateTime as created_at,
        metadata.LastUpdatedTime as updated_at

    from source
    
)

select * from renamed
