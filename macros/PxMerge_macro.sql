{%- macro PxMerge_macro(metadata_dict=none) -%}

{%- set source_model = metadata_dict['source_model'] -%}
{%- set merge_models = metadata_dict['merge_models'] -%}
{%- set merge_keys = metadata_dict['merge_keys'] -%}
{%- set unmatched_master_mode = metadata_dict['unmatched_master_mode'] -%}
{%- set derived_columns = metadata_dict['derived_columns'] -%}


{%- set merge_keys_list = merge_keys|join('||') -%}


SELECT {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }}
FROM (select *, MD5({{merge_keys_list}}) as src_key_list from {{ source_model }} ) {{ source_model }}

{%- if unmatched_master_mode == "keep" %}
    {%- for merge_model in merge_models %}
      {%- set i = loop.index %}
        left outer join 
        (select *, MD5({{merge_keys_list}}) as {{merge_model}}_key from {{merge_model}}){{merge_model}} 
        on {{ source_model }}.src_key_list = {{merge_model}}.{{merge_model}}_key
    {%- endfor %}
{%- endif -%}





{% endmacro %}