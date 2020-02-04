with source as (
    
    select * from {{ source('quickbooks', 'quickbooks_journalentries') }}
    
)

select 

    *,
    metadata:CreateTime::date as metadata__createtime,
    metadata:LastUpdatedTime::date as metadata__lastupdatedtime
    
from source