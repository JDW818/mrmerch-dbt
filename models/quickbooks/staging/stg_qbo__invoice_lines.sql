with

source as (

    select * from {{ source('quickbooks', 'invoice_line') }}

),

renamed as (

    select

      invoice_id,
      sub_total_item_id,
      description_tax_code_id,
      discount_account_id,
      sales_item_item_id,
      sales_item_tax_code_id,

      amount,
      sales_item_unit_price as unit_price,
      sales_item_quantity as quantity,
      description,
      discount_discount_percent discount_percent,
      discount_percent_based as is_discount_percent_based,

      _fivetran_synced
      
    from source

)

select * from renamed
