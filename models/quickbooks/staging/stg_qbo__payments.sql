with source as (

    select * from {{ source('quickbooks', 'payment') }}

),

renamed as (

    select

      id as payment_id,
      receivable_account_id,
      customer_id,
      deposit_to_account_id,
      payment_method_id,

      private_note,
      reference_number,

      total_amount,
      unapplied_amount,

      transaction_date,
      updated_at,
      created_at,
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
