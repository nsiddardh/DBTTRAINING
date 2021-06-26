{%- macro PxMerge_macro(metadata_dict=none) -%}

{%- set source_models = metadata_dict['source_models'] -%}


{%- for src_model in source_models %}
{%- set i = loop.index -%}
  {%- if i == source_models|length %}
   {%- set cols = metadata_dict['col_list'~loop.index] %}

   SELECT {{ create_alias(source_model=src_model,  derived_columns=cols) }} 
   FROM {{ src_model }}
   {%- endif -%}

   {%- if i != source_models|length %}
   {%- set cols = metadata_dict['col_list'~loop.index] %}

   SELECT {{ create_alias(source_model=src_model,  derived_columns=cols) }} 
   FROM {{ src_model }} union all
   {%- endif -%}
   

{%- endfor %}


{% endmacro %}