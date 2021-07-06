{%- macro PxAggregator_macro(metadata_dict=none) -%}

{%- set source_model = metadata_dict['source_model'] -%}

{%- set group_by_columns = metadata_dict['group_by_columns'] -%}

{%- set derived_columns = metadata_dict['derived_columns'] -%}

{%- set hashed_columns = metadata_dict['hashed_columns'] -%}

{%- set filter_conditions = metadata_dict['filter_conditions'] -%}

SELECT {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
FROM {{ source_model }}
GROUP BY 
{{group_by_columns}}
    
{% endmacro %}