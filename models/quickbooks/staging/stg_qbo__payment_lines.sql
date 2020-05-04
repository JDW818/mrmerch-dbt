with

source as (

  select * from {{ source('quickbooks','payment_line') }}

),

renamed as (

  select

    payment_id,
    check_id,
    credit_card_charge_id,
    credit_card_credit_id,
    credit_memo_id,
    deposit_id,
    expense_id,
    invoice_id,
    journal_entry_id,

    amount,

    _fivetran_synced,

  from source

)

select * from renamed
