{%- macro PxCopy_macro(metadata_dict=none) -%}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

SELECT {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
FROM {{ source_model }}

{% endmacro %}