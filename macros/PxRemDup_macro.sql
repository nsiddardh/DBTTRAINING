{%- macro PxRemDup_macro(metadata_dict=none) -%}

{% set key_columns = metadata_dict['key_columns'] %}
{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}
{% set dup_method = metadata_dict['dup_method'] %}



with source_data as (
SELECT  DISTINCT {{ create_alias(  source_model=source_model, derived_columns=derived_columns) }}
, ROW_NUMBER() OVER (PARTITION BY {{key_columns}} order by {{key_columns}}) AS rn
FROM {{source_model}} as XFM_HME
)

select * from source_data WHERE rn = 1


{% endmacro %}