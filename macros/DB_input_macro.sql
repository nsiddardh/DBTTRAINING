{%- macro DB_input_macro(metadata_dict=none) -%}


{% set source_columns = metadata_dict['source_columns'] %}
{% set source_table = metadata_dict['source_table'] %}
{% set source_query_override = metadata_dict['source_query_override'] %}



    {%- if source_query_override is not none -%}

       select {{ source_columns }} from {{ source_table }} 

    {%- else -%}

       {{ source_query_override }}

    {%- endif -%}
     
      

{% endmacro %}