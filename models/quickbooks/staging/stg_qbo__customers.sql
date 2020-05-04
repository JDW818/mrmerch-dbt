with

source as (

    select * from {{ source('quickbooks', 'customer') }}

),

renamed as (

    select

        id as customer_id,
        ar_account_id,
        currency_id,
        default_tax_code_id,
        bill_address_id,
        parent_customer_id,
        payment_method_id,
        sales_term_id,
        shipping_address_id,
        tax_exemption_reason_id,

        alternate_phone_number,
        balance,
        company_name,
        display_name,
        given_name as first_name,
        middle_name,
        family_name as last_name,
        suffix,
        fully_qualified_name,
        print_on_check_name,
        email,
        fax_number,
        phone_number,
        mobile_number,
        notes,
        preferred_delivery_method,
        resale_number,
        website,

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

        case
          when bill_with_parent = true
            then 1
          else 0
        end as is_bill_with_parent,

        open_balance_date,
        created_at,
        updated_at,
        _fivetran_synced

    from source

)

select * from renamed
