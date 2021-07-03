{%- macro Pxjoin_macro(metadata_dict=none) -%}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}
{% set lkp_models = metadata_dict['lkp_models'] %}
{% set join_type = metadata_dict['join_type'] %}
{% set join_conditions = metadata_dict['join_conditions'] %}

select {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
from {{ source_model }}  

{% for lookup_model in lkp_models %}1
    {{join_type[loop.index-1]}} {{lookup_model}}  on 
        {% for join_condition in join_conditions %}
        ({{ join_condition | replace(","," and ")}} )
        {% endfor %}
{% endfor %}
  

{% endmacro %}