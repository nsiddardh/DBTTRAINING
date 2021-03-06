{{ config(materialized='view') }}

{%- set yaml_metadata -%}

source_model: "monthly_sales"
pivot_type: "Vertical"
group_column: "empid"
agg_column: "amount"
pivot_column: "month"
array_index: 3

derived_columns:
    emp_id: 'empid'
    Month_1: 'Month'
    Month_2: 'Month_1'
    Month_3: 'Month_2'


{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}
{% set pivot_columns = metadata_dict['pivot_columns'] %}
{% set agg_column = metadata_dict['agg_column'] %}
{% set pivot_column = metadata_dict['pivot_column'] %}
{% set group_column = metadata_dict['group_column'] %}
{% set array_index = metadata_dict['array_index'] %}

{%- call statement('my_statement', fetch_result=True) -%}
      SELECT distinct month FROM {{ source_model }}
{%- endcall -%}

{% set j= array_index+1 %}

with pivot_data as (
select distinct {{group_column}}
{% for _ in range(1, j) %}
    {% if loop.index == 1 %}
    ,nth_value({{ pivot_column }}, {{loop.index}}) over (partition by {{ group_column }} order by (select 1)) as {{pivot_column}}
    {% endif %} 

    {% if loop.index != 1 %}
    {% set i= loop.index - 1 %}
    ,nth_value({{ pivot_column }}, {{loop.index}}) over (partition by {{ group_column }} order by (select 1)) as {{pivot_column~'_'~i}}
    {% endif %} 

{% endfor %}
from {{ source_model}}
)

select {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
from pivot_data