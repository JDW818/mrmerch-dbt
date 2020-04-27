with source as (
    
    select * from {{ source('quickbooks', 'payment') }}
    
),

renamed as (
    
    select
        
        id, as payment_id
        cast(customerref.value as int64) as customer_id,
        customerref.name as customer_name,
        nullif(cast(deposittoaccountref.value as varchar), '') as deposit_account_id,
        nullif(cast(paymentmethodref.value as varchar), '') as payment_method_id,
        
        privatenote as payment_description,
        
        totalamt as total,
        unappliedamt as unapplied_amt,
        
        cast(txndate as date) as txn_date,
        metadata.CreateTime as created_at,
        metadata.LastUpdatedTime as updated_at
    
    from source
    
)

select * from renamed
