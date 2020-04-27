 with source as (
    
    select * from {{ source('quickbooks', 'deposit') }}
    
),

renamed as (

    select
        
        id as deposit_id,
        account_id,
        cash_back_account_id,
        currency_id,
        
        transaction_date,
        transaction_source,
        transaction_status,
        
        private_note as memo,
        total_amount,
    
        created_at,
        updated_at,
        _fivetran_synced as fivetran_synced_at,
        _fivetran_deleted
    
    from source

)

select * from renamed
  

