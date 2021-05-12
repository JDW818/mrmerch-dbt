with source as (

    select * from {{ source('quickbooks', 'item') }}

),

renamed as (

    select

      id as item_id,
      sales_tax_code_id,
      asset_account_id,
      parent_item_id,
      expense_account_id,
      income_account_id,

      description as item_description,
      name item_name,

      case
        when active = true
          then 1
        else 0
      end as is_active,

      case
        when taxable = true
          then 1
        else 0
      end as is_taxable,

      created_at,
      updated_at,
      _fivetran_synced,

    from source

)

select * from renamed
