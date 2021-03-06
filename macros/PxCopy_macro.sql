{%- macro PxCopy_macro(metadata_dict=none) -%}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

WITH staging AS (
{{ dbtvault.stage(include_source_columns=false,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=none,
                  ranked_columns=none) }}
)

SELECT *
FROM staging

{% endmacro %}