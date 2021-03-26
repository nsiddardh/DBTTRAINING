{{ config(materialized='view') }}


/* -------STAGE VARIABLES SECTION--------This section repeats for all output links in transformation stage-----*/
{% set svStageVar = 'tx_poc_ln_in_tx.ORIG_NAME' %}

{% set svStageVar2 = svStageVar %}   /*  Replace Here with <component_name>_<link_name> run pre-cypher */
{% set svStageVar1 = 'Trim(tx_poc_ln_in_tx.ORIG_NAME)' %}
{% set svStageVar3 = '
CASE WHEN
    IsNotNull(tx_poc_ln_in_tx.ORIG_NAME) Then tx_poc_ln_in_tx.ORIG_NAME Else  ' + svStageVar1 + '
 END' %}

{% set svStageVar4 = 'Left(' + svStageVar3 + ',25)' %}   /*  Replace Here with <component_name>_<link_name> run pre-cypher */

/* -------EXPRESSIONS AND TARGET COLUMNS ALIASING SECTION--------*/

{%- set yaml_metadata -%}
source_model: "tx_poc_ln_in_tx"

component_name: Transformer_10
linkName: ln_in_tx
linkReplaceName: tx_poc_ln_in_tx
filter_conditions: ""
derived_columns:
    SAME_NAME: 'tx_poc_ln_in_tx.SAME_NAME'
    ORIG_NAME: '
CASE WHEN
    IsNotNull({{svStageVar4}}) Then {{svStageVar4}} Else tx_poc_ln_in_tx.ORIG_NAME
 END'

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ CTransformerStage_macro(metadata_dict) }}