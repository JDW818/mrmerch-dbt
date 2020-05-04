with

source as (

  select * from {{ source ('quickbooks','journal_entry_line') }}

),

renamed as (

  select

    journal_entry_id,
    tax_code_id,
    vendor_id,
    account_id,
    class_id,
    customer_id,
    department_id,
    description_tax_code_id,

    amount,
    description,

    case
      when billable_status = 'true'
        then 1
      else 0
    end as is_billable,

    case
      when posting_type = 'Debit'
        then 1
      else 0
    end as is_debit,

    case
      when posting_type = 'Credit'
        then 1
      else 0
    end as is_credit,

    _fivetran_synced

  from source

)

select * from renamed
