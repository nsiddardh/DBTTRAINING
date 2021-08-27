{{ config(materialized='view') }}



{%- set yaml_metadata -%}

before_model: "emp_src"
after_model: "emp1_src"

key_columns: ["empid"]
change_columns: ["empname","deptid"]

before_columns: 
    empid: 'empid'
    empname: 'empname'
    deptid: 'deptid'
after_columns: 
    empid: 'empid'
    empname: 'empname'
    deptid: 'deptid'
derived_columns:
    empid: 'empid'
    empname: 'empname'
    deptid: 'deptid'

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxChangeCapture_macro(metadata_dict) }}