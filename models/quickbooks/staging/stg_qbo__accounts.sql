with

source as (

    select * from {{ source('quickbooks', 'account') }}

),

renamed as (

    select

        id as account_id,
        tax_code_id,
        parent_account_id,

        account_number,
        account_sub_type,
        account_type,
        balance,
        balance_with_sub_accounts,
        classification,
        currency_id,
        description,
        fully_qualified_name,
        name,

        case
          when sub_account = true
            then 1
          else 0
        end as is_sub_account,

        case
          when active = true
            then 1
          else 0
        end as is_active,

        created_at,
        updated_at,
        _fivetran_synced


    from source

)

select * from renamed
