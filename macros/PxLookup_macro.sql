{%- macro PxLookup_macro(metadata_dict=none) -%}

{% set source_model = metadata_dict['lkp_models'][0] %}

{% set derived_columns = metadata_dict['derived_columns'] %}
{% set lkp_models = metadata_dict['lkp_models'] %}
{% set lkp_conditions = metadata_dict['lkp_conditions'] %}



select {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
from {{ source_model }} as {{ source_model }}  ,

{% for lookup_model in lkp_models %}
 {% set i = loop.index %}
  {% if i == lkp_conditions|length %}
     {{ lkp_models[i] }} as {{ lkp_models[i] }}
 {%- endif -%}
{% endfor %}

where 
{% for lkp_condition in lkp_conditions %}
    {% set j = loop.index %}
    {% if j == lkp_conditions|length %}
    {{ lkp_conditions[j-1] }}  
    {%- else -%} 
    {{ lkp_conditions[j-1] }}  and 
    {%- endif -%}
{% endfor %}
                  
{% endmacro %}