{{ config(materialized='view') }}


{%- set yaml_metadata -%}

source_model: "lkp_busi_dt"
lkp_models: ["odbc_time_day_dim","odbc_time_day_part"]
join_type: ["left outer join","inner join"]
join_conditions: [" lkp_busi_dt.TRANSACTION_DATE = odbc_time_day_dim.BUSIDAYDT ", " lkp_busi_dt.TRANSACTION_DATE = odbc_time_day_part.BUSIDAYDT "]
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

{{ Pxjoin_macro(metadata_dict) }}