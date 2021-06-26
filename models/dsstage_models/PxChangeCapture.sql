{{ config(materialized='view') }}



{%- set yaml_metadata -%}

source_model: "emp"
change_model: "emp1"
key_columns: ["empid","empname","dept"]
source_columns: 
    empid: 'empid'
    empname: 'empname'
    deptid: 'dept'
change_columns: 
    empid: 'empid'
    empname: 'empname'
    deptid: 'dept'
derived_columns:
    empid: 'empid'
    empname: 'empname'
    deptid: 'dept'

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxChangeCapture_macro(metadata_dict) }}