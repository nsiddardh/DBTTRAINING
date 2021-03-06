{%- macro PxLookup_macro(metadata_dict=none) -%}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}
{% set lkp_models = metadata_dict['lkp_models'] %}
{% set lkp_conidtions = metadata_dict['lkp_conidtions'] %}




select {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
from {{ source_model }} as {{ source_model }} left outer join 

{% for lookup_model in lkp_models %}
 {% set i = loop.index %}
 {{ lkp_models[i-1] }} as {{ lkp_models[i-1] }}
{% endfor %}

on 
{% for lkp_conidtion in lkp_conidtions %}
    {% set j = loop.index %}
    {% if j == lkp_conidtions|length %}
    {{ lkp_conidtions[j-1] }}  
    {%- else -%} 
    {{ lkp_conidtions[j-1] }}  and 
    {%- endif -%}
{% endfor %}
                  
{% endmacro %}