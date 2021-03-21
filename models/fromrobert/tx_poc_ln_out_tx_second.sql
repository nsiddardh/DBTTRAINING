


{{ config(materialized='view') }}

/* -------STAGE VARIABLES SECTION--------This section repeats for all output links in transformation stage-----*/
{% set sv_SAME_NAME = 'ln_in_tx.SAME_NAME' %}

/* -------EXPRESSIONS AND TARGET COLUMNS ALIASING SECTION--------*/
{%- set yaml_metadata -%}

source_model: "tx_poc_ln_in_tx"

filter_conditions: ""
derived_columns:
    SAME_NAME: 'tx_poc_ln_in_tx.SAME_NAME'
    NEW_NAME: 'tx_poc_ln_in_tx.ORIG_NAME'

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ CTransformerStage_macro(metadata_dict) }}


