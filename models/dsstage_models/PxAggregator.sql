{{ config(materialized='view') }}

{%- set yaml_metadata -%}

--source_model: "XFM_TZ"
source_model: "i_tbc_hme_timer_detail"
dup_method: "first"
group_columns: "TIMEZONE,TZ_CNT,ERS_CNT,Ttl_ERS,CURR_TIME,RUN_TIME"
derived_columns:
    TIMEZONE: "TIMEZONE"
    TZ_CNT: "TZ_CNT"
    ERS_CNT: "ERS_CNT"
    Ttl_ERS: "Ttl_ERS"
    CURR_TIME: "CURR_TIME"
    RUN_TIME: "RUN_TIME"
    TBE_Recvd: "sum(TBE_Recvd)"

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set group_columns = metadata_dict['group_columns'] %}
{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}
{% set dup_method = metadata_dict['dup_method'] %}

with source_data as (
SELECT  {{ create_alias(  source_model=source_model, derived_columns=derived_columns) }}
FROM {{source_model}} as XFM_HME
group by {{group_columns}}
)

select * from source_data