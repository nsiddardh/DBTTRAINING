{{ config(materialized='view') }}


{%- set yaml_metadata -%}

source_models: ["emp","emp1","emp2"]
col_list1:
    emp_id: "emp.empid"
    emp_name: "emp.empname"
col_list2:
    emp_id: "emp1.empid"
    emp_name: "emp1.empname"
col_list3:
    emp_id: "emp2.empid"
    emp_name: "emp2.empname"


{% endset %}


{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxMerge_macro(metadata_dict) }}