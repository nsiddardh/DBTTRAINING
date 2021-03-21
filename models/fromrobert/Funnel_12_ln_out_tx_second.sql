
{{ config(materialized='view') }}

/* -------STAGE VARIABLES SECTION--------This section repeats for all output links in transformation stage-----*/
/* -------EXPRESSIONS AND TARGET COLUMNS ALIASING SECTION--------*/
{%- set yaml_metadata -%}

source_model: "tx_poc_ln_out_tx_second"

filter_conditions: ""
derived_columns:
    NEW_NAME: 'NEW_NAME'
    SAME_NAME: 'SAME_NAME'

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ Has_Input_macro(metadata_dict) }}


