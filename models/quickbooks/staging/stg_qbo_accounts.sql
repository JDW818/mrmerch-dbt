with source  as (
    
    select * from {{ source('quickbooks', 'account') }}
    
),

renamed as (
    
    select
        
        id as account_id,
        account_number,
        account_sub_type,
        account_type,
        active,
        balance,
        balance_with_sub_accounts,
        classification,
        currency_id,
        description,
        fully_qualified_name,
        name,
        parent_account_id,
        sub_account,
        tax_code_id,
        
        created_at,
        updated_at,
        _fivetran_synced
        
        
    from source

)

select * from renamed
  
