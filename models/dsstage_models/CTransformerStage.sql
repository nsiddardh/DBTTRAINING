{{ config(materialized='view') }}

/* -------STAGE VARIABLES SECTION--------This section repeats for all output links in transformation stage-----*/
{% set sv_trim_lanenumber = 'TRIM(LANE_NUMBER)' %}
{% set sv_tot_serv_window_dur = '(case when SERVICE_WINDOW_DURATION is null then TOTAL_SPEED_OF_SERVICE_DURATION else SERVICE_WINDOW_DURATION end)' %}


/* -------EXPRESSIONS AND TARGET COLUMNS ALIASING SECTION--------*/
{%- set yaml_metadata -%}

source_model: "lkp_day_part"
filter_conditions: " DW_STOREID is not null "
derived_columns:
    DW_STOREID: 'DW_STOREID'
    DW_BUSI_DAY: 'DW_BUSI_DAY'
    DW_TRANS_DAY: 'DW_TRANS_DAY'
    DW_DAYPART: 'DW_DAYPART'
    OPEN_TIME_TXT: 'OPEN_TIME'
    CLOSE_TIME_TXT: 'TRIM(CLOSE_TIME)'
    TRANS_TIME_TXT: 'TRANSACTION_TIME'
    GREET_DELAY_DUR_SEC: 'GREET_DELAY'
    MENU_BOARD_DELAY_DUR_SEC: 'MENU_BOARD_DURATION'
    QUEUE_DUR_SEC: 'QUEUE_DURATION'
    CASHIER_WINDOW_DUR_SEC: 'CASHIER_WINDOW_DURATION'
    BOOTH_QUEUE_DUR_SEC: 'BOOTH_QUEUE_DURATION'
    SERV_WINDOW_QUEUE_DUR_SEC: 'SERVICE_WINDOW_DURATION'
    TOT_BOOTH_DUR_SEC: 'TOTAL_BOOTH_DURATION'
    WAIT_AREA_DUR_SEC: 'WAITING_AREA_DURATION'
    TOT_SOS_DUR_SECONDS: {{ sv_tot_serv_window_dur }}
    DRIVE_THRU_LANE_NBRLANE_NUMBER: {{ sv_trim_lanenumber }}
    TBC_LANE: 'TBC_LANE'
    CREATE_ID: '!JOBNAME'
    CREATE_TMSTMP: 'CURRENT_TIMESTAMP'
    UPDT_ID: '!JOBNAME'
    UPDT_TMSTMP: 'CURRENT_TIMESTAMP'



{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ CTrasaformerStage_macro(metadata_dict) }}