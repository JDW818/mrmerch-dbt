with source as (
    
    select * from   {{ source('quickbooks', 'class') }}
    
),

renamed as (

    select
        
        id,
        parent_class_id,
        
        fully_qualified_name,
        name,
        sub_class,
        
        active as is_active,
        
        created_at,
        updated_at,
        _fivetran_synced_at
    
    from source
    
)

select * from renamed
 