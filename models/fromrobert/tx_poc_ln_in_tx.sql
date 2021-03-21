
{{ config(materialized='view') }}

/* -------STAGE VARIABLES SECTION--------This section repeats for all output links in transformation stage-----*/
{% set sv_SAME_NAME = '' %}

/* -------EXPRESSIONS AND TARGET COLUMNS ALIASING SECTION--------*/
{%- set yaml_metadata -%}

source_model: "genrows_ln_in_tx"

filter_conditions: ""
derived_columns:
    SAME_NAME: 'SAME_NAME'
    ORIG_NAME: 'ORIG_NAME'

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ CTransformerStage_macro(metadata_dict) }}


