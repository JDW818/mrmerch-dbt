with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_journalentries') }}
    
)

select 

    accountref_value
    classref_value
    posting_type
    
from source