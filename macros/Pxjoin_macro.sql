{%- macro Pxjoin_macro(metadata_dict=none) -%}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}
{% set lkp_models = metadata_dict['lkp_models'] %}

{% set rem_src_model =  lkp_models.pop(0) %}

{% set join_type = metadata_dict['join_type'] %}
{% set join_keys = metadata_dict['join_keys'] %}

select {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
from {{ source_model }}  

{% for lookup_model in lkp_models %}
{{join_type}} {{lookup_model}}  on 
 {% for join_key in join_keys %}
    {% set i = loop.index %}
    {% if i == join_keys|length %}
        {{source_model}}.{{join_key}} = {{lookup_model}}.{{join_key}}
    {% else %}
        {{source_model}}.{{join_key}} = {{lookup_model}}.{{join_key}} and 
    {%- endif -%}

 {% endfor %}
 {% endfor %}
  

{% endmacro %}