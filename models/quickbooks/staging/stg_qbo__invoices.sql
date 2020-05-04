with source as (

    select * from {{ source('quickbooks', 'invoice') }}

),

renamed as (

    select

        id as invoice_id,
        doc_number as invoice_number,
        billing_address_id,
        shipping_address_id,
        sales_term_id,
        tax_code_id,
        customer_id,

        custom_rep as rep,
        tracking_number,
        customer_memo as memo,
        private_note as private_memo,
        billing_email,
        billing_cc_email,
        billing_bcc_email,

        total_amount,
        total_tax,
        balance,

        transaction_date,
        due_date,
        ship_date,
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
