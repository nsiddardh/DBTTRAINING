{{

    config(
        materialized='incremental',
        unique_key='product_id'
    )
}}

select * from {{ ref('stg_product') }}