{%- macro PxLookup_macro(metadata_dict=none) -%}

{% set source_model = metadata_dict['lkp_models'][0] %}

{% set derived_columns = metadata_dict['derived_columns'] %}
{% set lkp_models = metadata_dict['lkp_models'] %}
{% set lkp_conditions = metadata_dict['lkp_conditions'] %}



select {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
from {{ source_model }} as {{ source_model }}  

{% for lkpcond in lkp_conditions %}
 {% set i = loop.index %}
  {% if i < lkp_conditions|length %}
     left outer join {{ lkp_models[i] }} as {{ lkp_models[i] }} on 
     {{ lkp_conditions[i-1] }}
  {%- endif -%}
  {% if i == lkp_conditions|length %}
     left outer join {{ lkp_models[i] }} as {{ lkp_models[i] }}
     {{ lkp_conditions[i-1] }}
  {%- endif -%}
{% endfor %}

                  
{% endmacro %}