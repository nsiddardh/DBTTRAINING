{{ config(materialized='view') }}


{%- set yaml_metadata -%}

source_model: ""
lkp_models: ["seq_hme_detail","odbc_time_day_dim" ]
lkp_conditions: [" seq_hme_detail.BUSINESS_DATE=odbc_time_day_dim.busidaydt"]
partition_by_field: ["busidaydt"]
lkp_field: ["DW_DAY"]

derived_columns:
    STORE_ID: "seq_hme_detail.STORE_ID"
    DW_BUSI_DAY: "odbc_time_day_dim.DW_DAY"
    DW_STOREID: "seq_hme_detail.DW_STOREID"
    BUSINESS_DATE: "seq_hme_detail.BUSINESS_DATE"
    OPEN_TIME: "seq_hme_detail.OPEN_TIME"
    CLOSE_TIME: "seq_hme_detail.CLOSE_TIME"
    TRANSACTION_DATE: "seq_hme_detail.TRANSACTION_DATE"
    TRANS_DATE_TXT: "seq_hme_detail.TRANS_DATE_TXT"
    TRANSACTION_TIME: "seq_hme_detail.TRANSACTION_TIME"
    GREET_DELAY: "seq_hme_detail.GREET_DELAY"
    MENU_BOARD_DURATION: "MENU_BOARD_DURATION"
    QUEUE_DURATION: "seq_hme_detail.QUEUE_DURATION"
    CASHIER_WINDOW_DURATION: "seq_hme_detail.CASHIER_WINDOW_DURATION"
    BOOTH_QUEUE_DURATION: "seq_hme_detail.BOOTH_QUEUE_DURATION"
    SERVICE_WINDOW_DURATION: "seq_hme_detail.SERVICE_WINDOW_DURATION"
    TOTAL_BOOTH_DURATION: "seq_hme_detail.TOTAL_BOOTH_DURATION"
    WAITING_AREA_DURATION: "seq_hme_detail.WAITING_AREA_DURATION"
    TRANSACTION_TIME_LKP: "seq_hme_detail.TRANSACTION_TIME_LKP"
    TOTAL_SPEED_OF_SERVICE_DURATION: "seq_hme_detail.TOTAL_SPEED_OF_SERVICE_DURATION"
    LANE_NUMBER: "seq_hme_detail.LANE_NUMBER"
    TBC_LANE: "seq_hme_detail.TBC_LANE"

{% endset %}


{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ PxLookup_macro(metadata_dict) }}