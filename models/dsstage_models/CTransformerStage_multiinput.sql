{{ config(materialized='view') }}

/* -------STAGE VARIABLES SECTION--------This section repeats for all output links in transformation stage-----*/
{% set sv_trim_lanenumber = 'TRIM(LANE_NUMBER)' %}
{% set sv_tot_serv_window_dur = '(case when SERVICE_WINDOW_DURATION is null then TOTAL_SPEED_OF_SERVICE_DURATION else SERVICE_WINDOW_DURATION end)' %}


/* -------EXPRESSIONS AND TARGET COLUMNS ALIASING SECTION--------*/
{%- set yaml_metadata -%}

source_model: "lkp_busi_dt"
lkp_models: ["odbc_time_day_dim","odbc_time_day_dim"]
join_type: ["left outer join","left outer join"]
join_conidtions: [" lkp_busi_dt.business_date = odbc_time_day_dim.BUSIDAYDT "," lkp_busi_dt.TRANSACTION_DATE = odbc_time_day_dim.BUSIDAYDT "]
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
    TOTAL_SPEED_OF_SERVICE_DURATION: {{ sv_tot_serv_window_dur }}
    LANE_NUMBER: {{ sv_trim_lanenumber }}
    TBC_LANE: "lkp_busi_dt.TBC_LANE"


{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ CTrasaformerStage_multipleinputs_macro(metadata_dict) }}