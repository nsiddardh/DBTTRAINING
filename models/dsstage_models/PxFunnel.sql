{{ config(materialized='view') }}
{%- set yaml_metadata -%}

source_models: "PxFilter,PxFilter_copy"
