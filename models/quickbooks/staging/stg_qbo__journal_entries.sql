with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_journalentries') }}
    
)

select * from source