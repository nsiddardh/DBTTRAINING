{{ config(materialized='view') }}

{%- set yaml_metadata -%}

source_model: "monthly_sales"
pivot_type: "Vertical"
group_column: "empid"
agg_column: "amount"
pivot_column: ["month","month"]
array_index: 4

derived_columns:
    emp_id: 'empid'
    Month_1: 'Month_1'
    Month_2: 'Month_2'
    Month_3: 'Month_3'


{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}


{{ PxPivot_macro(metadata_dict) }}