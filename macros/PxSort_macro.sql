{%- macro PxSort_macro(metadata_dict=none) -%}


{% set sort_columns = metadata_dict['sort_columns'] %}
{% set source_model = metadata_dict['source_model'] %}

select * from {{ source_model }} order by {{ sort_columns }}

{% endmacro %}