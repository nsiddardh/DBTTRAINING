{{ config(materialized='view') }}

{%- set yaml_metadata -%}

source_table: "jn_srcs_Lnk_src_appl"
source_columns: "APP_PKG_ID,PARTY_PD_ID"
        
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxSequentialFile_macro(metadata_dict) }}