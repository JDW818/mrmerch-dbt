with source as (
    
    select * from {{ source('quickbooks', 'purchase') }}
    
),

renamed as (
    
    select
        
        id as purchase_id,
        paymenttype as payment_type,
        totalamt as total,
        cast(txndate as date) as txn_date,
        #credit,
        cast(accountref.value as int64) as account_id,
        --the following three fields contain information on who was paid for this record.
        --the payment can be made to a vendor, customer, or employee. this is found in entity_type.
        --based on entity_type, the id value should be mapped to the corresponding table to get details.
        cast(entityref.value as int64) as vendor_id,
        entityref.name as entity_name,
        entityref.type as entity_type,
        metadata.CreateTime as created_at,
        metadata.LastUpdatedTime as updated_at
    
    from source

)

select * from renamed
