{%- macro PxLookup_macro(metadata_dict=none) -%}

{% set source_model = metadata_dict['lkp_models'][0] %}

{% set derived_columns = metadata_dict['derived_columns'] %}
{% set lkp_models = metadata_dict['lkp_models'] %}
{% set lkp_conditions = metadata_dict['lkp_conditions'] %}
{% set lkp_field = metadata_dict['lkp_field'] %}
{% set partition_by_field = metadata_dict['partition_by_field'] %}



select {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
from {{ source_model }} as {{ source_model }}  

{% for lkpcond in lkp_conditions %}
 {% set i = loop.index %}
  
  {% if i <= lkp_conditions|length %}
     left outer join (select distinct {{ partition_by_field[i-1] }} , 
     {% set lkp_fields = lkp_field[i-1].split(',') %}
         {% for lkp in lkp_fields %}
            {% set j = loop.index %}
            {% if j < lkp_fields|length %}
               first_value({{lkp_fields[j-1]}}) over(partition by  {{partition_by_field[i-1]}} order by select(1) ) as {{lkp_fields[j-1]}} ,
            {% else %}
               first_value({{lkp_fields[j-1]}}) over(partition by  {{partition_by_field[i-1]}} order by select(1) ) as {{lkp_fields[j-1]}}
            {%- endif -%}
         {% endfor %}
     from {{ lkp_models[i] }})  {{ lkp_models[i] }} on 
     {{ lkp_conditions[i-1] }}
  {%- endif -%}

{% endfor %}

                  
{% endmacro %}


{%- macro PxLookup_macro_bkp(metadata_dict=none) -%}

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