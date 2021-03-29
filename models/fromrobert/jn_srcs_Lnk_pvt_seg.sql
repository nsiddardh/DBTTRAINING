{{ config(materialized='view') }}

{%- set yaml_metadata -%}

source_table: "jn_srcs_Lnk_pvt_seg"
source_columns: "APP_PKG_ID,USAA_PARTY_PD_ID"
        
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxSequentialFile_macro(metadata_dict) }}