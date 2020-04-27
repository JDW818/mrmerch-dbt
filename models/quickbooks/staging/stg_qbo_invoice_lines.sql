with source as (
    
    select * from {{ source('quickbooks', 'invoice_line') }}
    
),

renamed as (
    
    select
        
        cast(id as int64) as invoice_id,
        docnumber as mm_invoice_id,
        cast(customerref.value as int64) as customer_id,
        customerref.name as customer_name,
        
        totalamt as invoice_total,
        balance as open_balance,
        line.value.amount as line_amount,
        line.value.salesitemlinedetail.itemref.name,
        
        cast(txndate as date) as invoice_date,
        cast(duedate as date) as due_date,
        metadata.CreateTime as created_at,
        metadata.LastUpdatedTime as updated_at
    
    from source, unnest(line) as line
    where line.value.detailtype = 'SalesItemLineDetail'

)

select * from renamed
