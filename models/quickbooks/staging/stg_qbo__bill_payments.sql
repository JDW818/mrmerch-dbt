with

source as (

    select * from {{ source('quickbooks', 'bill_payment') }}

),

renamed as (

    select

        id as bill_payment_id,
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
        _fivetran_synced as fivetran_synced_at,
        case
          when _fivetran_deleted = true
            then 1
          else 0
        end as is_deleted

    from source

)

select * from renamed
where is_deleted = 0
