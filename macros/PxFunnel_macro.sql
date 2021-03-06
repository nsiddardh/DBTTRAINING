{%- macro PxFunnel_macro(metadata_dict=none) -%}

{% set source_models = metadata_dict['source_models'] %}

--create below set variables based on no of sources

{% set i = 0 %}


{% for model in source_models %}
 {% set i = loop.index %}
 
    {% set source_model = source_models[i-1] %}
    {% set derived_columns = metadata_dict['source_columns_' ~ loop.index|string] %}
    
    {% if i == source_models|length %}

    SELECT {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
    FROM {{ source_models[i-1] }} 
    {%- else -%} 
    SELECT {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
    FROM {{ source_models[i-1] }} 
    union all 
    {%- endif -%}
{% endfor %}


{% endmacro %}