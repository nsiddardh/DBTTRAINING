{%- macro PxPivot_macro(metadata_dict=none) -%}

{%- set source_model = metadata_dict['source_model'] -%}
{%- set derived_columns = metadata_dict['derived_columns'] -%}
{%- set pivot_columns = metadata_dict['pivot_columns'] -%}
{%- set agg_column = metadata_dict['agg_column'] -%}
{%- set pivot_column = metadata_dict['pivot_column'] -%}
{%- set group_column = metadata_dict['group_column'] -%}
{%- set array_index = metadata_dict['array_index'] -%}



with pivot_data as (
select distinct {{group_column}}
{%- for pvtcol in pivot_column -%}
    {%- set indx = loop.index -%}
    {%- set j = array_index[indx-1]| int + 1-%}
    {%- for _ in range(1, j) -%}
        {%- if loop.index == 1 -%}
        ,nth_value({{ pvtcol }}, {{loop.index}}) over (partition by {{ group_column }} order by (select 1)) as {{pvtcol}}
        {%- endif -%} 

        {%- if loop.index != 1 -%}
        {%- set i= loop.index - 1 -%}
        ,nth_value({{ pvtcol }}, {{loop.index}}) over (partition by {{ group_column }} order by (select 1)) as {{pvtcol~'_'~i}}
        {%- endif -%} 

    {%- endfor -%}
{%- endfor %}
 from {{ source_model}}
)

select {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
from pivot_data


{%- endmacro -%}