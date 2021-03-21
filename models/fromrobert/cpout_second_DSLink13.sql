
{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "Funnel_12_DSLink13"
derived_columns:
    SAME_NAME: 'SAME_NAME'
    NEW_NAME: 'NEW_NAME'

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxCopy_macro(metadata_dict) }}


