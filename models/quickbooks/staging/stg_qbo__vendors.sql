with source as (

    select * from {{ source('quickbooks', 'vendor') }}

),

renamed as (

    select

      id as vendor_id,
      term_id as vendor_payment_term_id,
      billing_address_id,

      account_number,
      balance,

      company_name as vendor_name,
      display_name as vendor_display_name,
      print_on_check_name,
      email as vendor_email,
      title,
      suffix,
      family_name as last_name,
      middle_name,
      given_name as first_name,
      web_url,

      case
        when active = true
          then 1
        else 0
      end as is_active,

      case
        when vendor_1099 = true
          then 1
        else 0
      end as is_1099,

      primary_phone,
      mobile_phone,
      alternate_phone,
      fax_number,

      created_at,
      updated_at,
      _fivetran_synced

    from source

)

select * from renamed
