{{ config(materialized='view') }}


{%- set yaml_metadata -%}
source_model: "emp_src"
group_by_columns: "deptid, empid"
derived_columns:
    deptid: "deptid"
    empid: "empid"
    max_sal: "max(sal)"

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxAggregator_macro(metadata_dict) }}