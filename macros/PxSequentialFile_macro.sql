{%- macro PxSequentialFile_macro(metadata_dict=none) -%}


{% set source_columns = metadata_dict['source_columns'] %}
{% set source_table = metadata_dict['source_table'] %}

   select {{ source_columns }} from {{ source_table }} 

{% endmacro %}