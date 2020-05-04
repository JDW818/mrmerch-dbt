with

source as (

    select * from   {{ source('quickbooks', 'class') }}

),

renamed as (

    select

        id as class_id,
        parent_class_id,

        fully_qualified_name,
        name,
        sub_class,

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
