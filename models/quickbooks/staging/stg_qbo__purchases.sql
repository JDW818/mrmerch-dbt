with source as (

    select * from {{ source('quickbooks', 'purchase') }}

),

renamed as (

    select

      id as expense_id,
      vendor_id,
      account_id,
      customer_id,
      tax_code_id,
      payment_method_id,
      remit_to_address_id,

      private_note,

      total_amount,
      total_tax,

      transaction_date,
      created_at,
      updated_at,
      _fivetran_synced,
      case
        when _fivetran_deleted = true
          then 1
        else 0
      end as is_deleted

    from source

)

select * from renamed
where is_deleted = 0
