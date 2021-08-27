{{ config(materialized='view') }}


{%- set yaml_metadata -%}

source_model: "emp_src"
merge_models: ["emp1_src","emp2_src"]
unmatched_master_mode: "Keep"
merge_keys: ["empid"]

derived_columns:
    emp_id: "emp_src.empid"
    emp_name: "emp1_src.empname"
    deptid: "emp2_src.deptid"



{% endset %}


{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxMerge_macro(metadata_dict) }}