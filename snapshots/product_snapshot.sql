{% snapshot product_snapshot %}
{{
    config(
        target_schema = 'snapshot',
        strategy='check',
        unique_key='product_id',
        check_cols='all'
    )

}}

select 
*
from {{ ref('stg_product') }}

{% endsnapshot %}