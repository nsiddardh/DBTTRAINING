{{ config(materialized='view') }}

{%- set yaml_metadata -%}

source_model: "dsjb16_lnk_src_seg"
pivot_type: "Vertical"
group_column: "APP_PKG_ID,PARTY_PD_ID"
agg_column: ""
pivot_column: "SEG_VAL_NR"
array_index: 10

derived_columns:
    AGG_PKG_ID: 'AGG_PKG_ID'
    PARTY_PD_ID: 'PARTY_PD_ID'
    SEG_VAL_NR: 'SEG_VAL_NR'
    SEG_VAL_NR_1: 'SEG_VAL_NR_1'
    SEG_VAL_NR_2: 'SEG_VAL_NR_2'
    SEG_VAL_NR_3: 'SEG_VAL_NR_3'
    SEG_VAL_NR_4: 'SEG_VAL_NR_4'
    SEG_VAL_NR_5: 'SEG_VAL_NR_5'
    SEG_VAL_NR_6: 'SEG_VAL_NR_6'
    SEG_VAL_NR_7: 'SEG_VAL_NR_7'
    SEG_VAL_NR_8: 'SEG_VAL_NR_8'
    SEG_VAL_NR_9: 'SEG_VAL_NR_9'


{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}


{{ PxPivot_macro(metadata_dict) }}