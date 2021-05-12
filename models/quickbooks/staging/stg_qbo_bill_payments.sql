with source as (
    
    select * from {{ source('quickbooks', 'bill_payment') }}
    
),

renamed as (

    select
        
        id,
        vendor_id,
        check_bank_account_id,
        credit_card_account_id,
        currency_id,
        department_id,
        payable_account_id,
        
        check_print_status,
        doc_number,
        exchange_rate,
        pay_type,
        private_note as memo,
        process_bill_payment,
        total_amount,
        
        transaction_date,
        created_at,
        updated_at,
        _fivetran_synced,
        _fivetran_deleted
            
    from source
    
)

select * from renamed
