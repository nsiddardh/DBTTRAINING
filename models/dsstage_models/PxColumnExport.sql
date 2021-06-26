{{ config(materialized='view') }}


{%- set yaml_metadata -%}
source_model: "emp_src"
column_to_export: "emp"
keep_import_column: "false"
column_method: "Explicit"
delimiter: ","
source_columns:
    - empid 
    - empname 
    - dept

{% endset %}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{%- set source_columns = metadata_dict['source_columns'] -%}
{%- set source_model = metadata_dict['source_model'] -%}
{%- set column_to_export = metadata_dict['column_to_export'] -%}
{%- set column_method = metadata_dict['column_method'] -%}
{%- set delimiter = metadata_dict['delimiter'] -%}

{% set col_list = key_columns|join('||') %}
 
SELECT 


FROM {{source_model}}


{{col_list}}