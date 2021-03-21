

{{ config(materialized='view') }}

{%- set yaml_metadata -%}

source_models: ["Funnel_12_ln_out_tx_first","Funnel_12_ln_out_tx_second"]

source_columns_1:
     SAME_NAME: 'Funnel_12_ln_out_tx_first.SAME_NAME'
     NEW_NAME: 'Funnel_12_ln_out_tx_first.NEW_NAME'

source_columns_2:
     NEW_NAME: 'Funnel_12_ln_out_tx_second.NEW_NAME'
     SAME_NAME: 'Funnel_12_ln_out_tx_second.SAME_NAME'

 

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxFunnel_macro(metadata_dict) }}


