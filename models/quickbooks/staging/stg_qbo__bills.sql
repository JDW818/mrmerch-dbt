with

source as (

    select * from {{ source('quickbooks', 'bill') }}

),

renamed as (

    select

    id as bill_id,
    vendor_id,
    sales_term_id,
    payable_account_id,
    currency_id,
    department_id,

    balance,
    doc_number,
    due_date,

    private_note as memo,
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
