{{ config(materialized='view') }}

{%- set yaml_metadata -%}

source_table: "jn_srcs_lnk_src_addr"
source_columns: "APP_PKG_ID,USAA_PARTY_PD_ID,DEP_CUST_RSK_SCR_SVC_FAIL_CD,DEP_UW_MBR_NR_RESC_CD,MBR_RLTN_VAR_FAIL_CD"
        
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxSequentialFile_macro(metadata_dict) }}