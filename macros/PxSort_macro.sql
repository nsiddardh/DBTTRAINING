{%- macro PxSort_macro(metadata_dict=none) -%}


{% set sort_columns = metadata_dict['sort_columns'] %}
{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}

select {{ create_alias(  source_model=source_model, derived_columns=derived_columns) }} 
from {{ source_model }} order by {{ sort_columns }}

{% endmacro %}