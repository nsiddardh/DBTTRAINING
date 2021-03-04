{{ config(materialized='view') }}


{%- set yaml_metadata -%}

source_model: "lkp_busi_dt"
lkp_models: ["odbc_time_day_dim"]
join_type: ["left outer join"]
join_conidtions: [" lkp_busi_dt.TRANSACTION_DATE = odbc_time_day_dim.BUSIDAYDT "]
derived_columns:
    DW_BUSI_DAY: "lkp_busi_dt.DW_BUSI_DAY"
    DW_TRANS_DAY: "odbc_time_day_dim.DW_DAY"
    STORE_ID: "lkp_busi_dt.STORE_ID"
    DW_STOREID: "lkp_busi_dt.DW_STOREID"
    BUSINESS_DATE: "lkp_busi_dt.BUSINESS_DATE"
    OPEN_TIME: "lkp_busi_dt.OPEN_TIME"
    CLOSE_TIME: "lkp_busi_dt.CLOSE_TIME"
    TRANSACTION_DATE: "lkp_busi_dt.TRANSACTION_DATE"
    TRANS_DATE_TXT: "lkp_busi_dt.TRANS_DATE_TXT"
    TRANSACTION_TIME: "lkp_busi_dt.TRANSACTION_TIME"
    GREET_DELAY: "lkp_busi_dt.GREET_DELAY"
    MENU_BOARD_DURATION: "lkp_busi_dt.MENU_BOARD_DURATION"
    QUEUE_DURATION: "lkp_busi_dt.QUEUE_DURATION"
    CASHIER_WINDOW_DURATION: "lkp_busi_dt.CASHIER_WINDOW_DURATION"
    BOOTH_QUEUE_DURATION: "lkp_busi_dt.BOOTH_QUEUE_DURATION"
    SERVICE_WINDOW_DURATION: "lkp_busi_dt.SERVICE_WINDOW_DURATION"
    TOTAL_BOOTH_DURATION: "lkp_busi_dt.TOTAL_BOOTH_DURATION"
    WAITING_AREA_DURATION: "lkp_busi_dt.WAITING_AREA_DURATION"
    TRANSACTION_TIME_LKP: "lkp_busi_dt.TRANSACTION_TIME_LKP"
    TOTAL_SPEED_OF_SERVICE_DURATION: "lkp_busi_dt.TOTAL_SPEED_OF_SERVICE_DURATION"
    LANE_NUMBER: "lkp_busi_dt.LANE_NUMBER"
    TBC_LANE: "lkp_busi_dt.TBC_LANE"

{% endset %}


{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}
{% set lkp_models = metadata_dict['lkp_models'] %}
{% set lkp_conidtions = metadata_dict['lkp_conidtions'] %}
{% set join_type = metadata_dict['join_type'] %}
{% set join_conidtions = metadata_dict['join_conidtions'] %}




select {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
from {{ source_model }} as {{ source_model }}  

{% for lookup_model in lkp_models %}
 {% set i = loop.index %}
{{ join_type[i-1] }}   {{ lkp_models[i-1] }} as {{ lkp_models[i-1] }} on {{ join_conidtions[i-1] }}
{% endfor %}
  