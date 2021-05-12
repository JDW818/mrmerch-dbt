with source as (

    select * from {{ source('quickbooks', 'journal_entry') }}

),

renamed as (

    select

      id as journal_entry_id,
      tax_code_id,
      currency_id,
      doc_number,

      private_note,

      total_amount,
      total_tax as tax_amount,

      case
        when adjustment = true
          then 1
        else 0
      end as is_adjustment,

      case
        when _fivetran_deleted = true
          then 1
        else 0
      end as is_deleted,

      transaction_date,
      created_at,
      updated_at,
      _fivetran_synced

    from source

)

select * from renamed
where is_deleted = 0
