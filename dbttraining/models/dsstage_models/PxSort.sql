{{ config(materialized='view') }}


{%- set yaml_metadata -%}

source_model: "i_tbc_hme_timer_detail"
sort_columns: "DW_STOREID ASC,DW_TRANS_DAY DESC,TRANS_TIME_TXT ASC"

        
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set sort_columns = metadata_dict['sort_columns'] %}
{% set source_model = metadata_dict['source_model'] %}

select * from {{ source_model }} order by {{ sort_columns }}