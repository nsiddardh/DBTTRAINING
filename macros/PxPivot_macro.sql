{%- macro PxPivot_macro(metadata_dict=none) -%}

{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}
{% set pivot_columns = metadata_dict['pivot_columns'] %}
{% set agg_column = metadata_dict['agg_column'] %}
{% set pivot_column = metadata_dict['pivot_column'] %}
{% set group_column = metadata_dict['group_column'] %}

{%- call statement('my_statement', fetch_result=True) -%}
      SELECT distinct month FROM {{ source_model }}
{%- endcall -%}

{%- set my_var = remove_braces(remove_brackets(load_result('my_statement')['data'])  ) -%}
{% set i=0 %}
{% set j= load_result('my_statement')['data']|length %}

SELECT {{group_column}}
{% for all_pivot_columns in load_result('my_statement')['data'] %}
,{{remove_comma(remove_braces(remove_brackets(all_pivot_columns)))}} as {{ pivot_column~'_'~loop.index }}
{% endfor %}
from 
(select * from {{ source_model }}
pivot( sum({{ agg_column }}) for {{pivot_column}} in ( {{ my_var }} '' )
) as p 
order by {{ group_column }}
)t


{% endmacro %}