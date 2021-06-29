{{ config(materialized='view') }}


{%- set yaml_metadata -%}

source_model: ""
lkp_models: ["lkp_trans_dt","odbc_time_day_part","odbc_time_day_dim"]
lkp_conditions: [" lkp_trans_dt.TRANSACTION_TIME_LKP BETWEEN odbc_time_day_part.DAYPART_BGN_TM AND odbc_time_day_part.DAYPART_END_TM","lkp_trans_dt.BUSINESS_DATE=odbc_time_day_dim.busidaydt"]
derived_columns:
    DW_BUSI_DAY: "lkp_trans_dt.DW_BUSI_DAY"
    DW_TRANS_DAY: "lkp_trans_dt.DW_TRANS_DAY"
    DW_DAYPART: "odbc_time_day_part.DW_DAYPART"
    STORE_ID: "lkp_trans_dt.STORE_ID"
    DW_STOREID: "lkp_trans_dt.DW_STOREID"
    BUSINESS_DATE: "lkp_trans_dt.BUSINESS_DATE"
    OPEN_TIME: "lkp_trans_dt.OPEN_TIME"
    CLOSE_TIME: "lkp_trans_dt.CLOSE_TIME"
    TRANSACTION_DATE: "lkp_trans_dt.TRANSACTION_DATE"
    TRANS_DATE_TXT: "lkp_trans_dt.TRANS_DATE_TXT"
    TRANSACTION_TIME: "lkp_trans_dt.TRANSACTION_TIME"
    GREET_DELAY: "lkp_trans_dt.GREET_DELAY"
    MENU_BOARD_DURATION: "MENU_BOARD_DURATION"
    QUEUE_DURATION: "lkp_trans_dt.QUEUE_DURATION"
    CASHIER_WINDOW_DURATION: "lkp_trans_dt.CASHIER_WINDOW_DURATION"
    BOOTH_QUEUE_DURATION: "lkp_trans_dt.BOOTH_QUEUE_DURATION"
    SERVICE_WINDOW_DURATION: "lkp_trans_dt.SERVICE_WINDOW_DURATION"
    TOTAL_BOOTH_DURATION: "lkp_trans_dt.TOTAL_BOOTH_DURATION"
    WAITING_AREA_DURATION: "lkp_trans_dt.WAITING_AREA_DURATION"
    TRANSACTION_TIME_LKP: "lkp_trans_dt.TRANSACTION_TIME_LKP"
    TOTAL_SPEED_OF_SERVICE_DURATION: "lkp_trans_dt.TOTAL_SPEED_OF_SERVICE_DURATION"
    LANE_NUMBER: "lkp_trans_dt.LANE_NUMBER"
    TBC_LANE: "lkp_trans_dt.TBC_LANE"

{% endset %}


{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxSwitch_macro_bkp(metadata_dict) }}