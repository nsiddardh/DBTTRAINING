{%- macro PxChecksum_macro(metadata_dict=none) -%}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{% set checksum_cols = metadata_dict['checksum_cols'] %}


SELECT {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} , {{ dbtvault.hash(checksum_cols,'checksum') }} 
FROM {{ source_model }}

    
{% endmacro %}