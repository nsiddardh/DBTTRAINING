{{ config(materialized='view') }}


{%- set yaml_metadata -%}
source_model: "lkp_day_part"
derived_columns:
    DW_STOREID: 'DW_STOREID'
    DW_BUSI_DAY: 'DW_BUSI_DAY'
    DW_TRANS_DAY: 'DW_TRANS_DAY'
    DW_DAYPART: 'DW_DAYPART'
    OPEN_TIME_TXT: 'OPEN_TIME'
    CLOSE_TIME_TXT: 'CLOSE_TIME'
    TRANS_TIME_TXT: 'TRANSACTION_TIME'
    GREET_DELAY_DUR_SEC: 'GREET_DELAY'
    MENU_BOARD_DELAY_DUR_SEC: 'MENU_BOARD_DURATION'
    QUEUE_DUR_SEC: 'QUEUE_DURATION'
    CASHIER_WINDOW_DUR_SEC: 'CASHIER_WINDOW_DURATION'
    BOOTH_QUEUE_DUR_SEC: 'BOOTH_QUEUE_DURATION'
    SERV_WINDOW_QUEUE_DUR_SEC: 'SERVICE_WINDOW_DURATION'
    TOT_BOOTH_DUR_SEC: 'TOTAL_BOOTH_DURATION'
    WAIT_AREA_DUR_SEC: 'WAITING_AREA_DURATION'
    TOT_SOS_DUR_SECONDS: 'TOTAL_SPEED_OF_SERVICE_DURATION'
    DRIVE_THRU_LANE_NBRLANE_NUMBER: 'LANE_NUMBER'
    TBC_LANE: 'TBC_LANE'
    CREATE_ID: '!JOBNAME'
    CREATE_TMSTMP: 'CURRENT_TIMESTAMP'
    UPDT_ID: '!JOBNAME'
    UPDT_TMSTMP: 'CURRENT_TIMESTAMP'



{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

--{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

WITH staging AS (
{{ dbtvault.stage(include_source_columns=false,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=none,
                  ranked_columns=none) }}
)

SELECT *
FROM staging