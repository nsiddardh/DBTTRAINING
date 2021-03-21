


{{ config(materialized='view') }}

{%- set yaml_metadata -%}

source_table: "genrows"
source_columns: "SAME_NAME,ORIG_NAME"

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxSequentialFile_macro(metadata_dict) }}


