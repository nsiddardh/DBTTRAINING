{%- macro Pxjoin_macro(metadata_dict=none) -%}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}
{% set lkp_models = metadata_dict['lkp_models'] %}
{% set lkp_conidtions = metadata_dict['lkp_conidtions'] %}
{% set join_type = metadata_dict['join_type'] %}
{% set join_conidtions = metadata_dict['join_conidtions'] %}




select {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
from {{ source_model }} as {{ source_model }}  

{% for lookup_model in lkp_models %}
 {% set i = loop.index %}
{{ join_type[i-1] }}   {{ lkp_models[i-1] }} as {{ lkp_models[i-1] }} on {{ join_conidtions[i-1] }}
{% endfor %}
  

{% endmacro %}