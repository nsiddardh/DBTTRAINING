{{ config(materialized='view') }}


{%- set yaml_metadata -%}

source_model: "jn_srcs_lnk_src_addr"
lkp_models: ["jn_srcs_lnk_src_addr", "jn_srcs_Lnk_src_nas","jn_srcs_Lnk_src_appl","jn_srcs_Lnk_pvt_seg"]
join_type: "left outer join"
join_keys: ["APP_PKG_ID","USAA_PARTY_PD_ID"]
derived_columns:
    APP_PKG_ID: "jn_srcs_lnk_src_addr.APP_PKG_ID"
    USAA_PARTY_PD_ID: "jn_srcs_lnk_src_addr.USAA_PARTY_PD_ID"
    DEP_CUST_RSK_SCR_SVC_FAIL_CD: "jn_srcs_lnk_src_addr.DEP_CUST_RSK_SCR_SVC_FAIL_CD"
    DEP_UW_MBR_NR_RESC_CD: "jn_srcs_lnk_src_addr.DEP_UW_MBR_NR_RESC_CD"
    MBR_RLTN_VAR_FAIL_CD: "jn_srcs_lnk_src_addr.MBR_RLTN_VAR_FAIL_CD"

{% endset %}


{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ Pxjoin_macro(metadata_dict) }}