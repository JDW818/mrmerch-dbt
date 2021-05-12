with

source as (

  select * from {{ source('quickbooks','purchase_line')}}

),

renamed as (

  select

    purchase_id,
    account_expense_account_id,
    account_expense_class_id,
    account_expense_customer_id,
    account_expense_tax_code_id,
    item_expense_class_id,
    item_expense_customer_id,
    item_expense_item_id,
    item_expense_tax_code_id,

    account_expense_billable_status,
    item_expense_billable_status,

    amount,
    account_expense_tax_amount,
    description,
    item_expense_quantity,

    item_expense_unit_price,

    _fivetran_synced,

  from source

)

select * from renamed
