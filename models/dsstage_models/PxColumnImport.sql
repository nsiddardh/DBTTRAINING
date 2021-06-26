{{ config(materialized='view') }}


{%- set yaml_metadata -%}
source_model: "emp_src"
import_column: "emp"
keep_import_column: "false"
column_method: "Explicit"
delimiter: ","
derived_columns:
    - empid 
    - empname 
    - dept

{% endset %}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ PxColumnImport_macro(metadata_dict) }}