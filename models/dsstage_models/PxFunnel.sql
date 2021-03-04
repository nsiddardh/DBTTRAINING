{{ config(materialized='view') }}

{%- set yaml_metadata -%}

source_models: ["lkp_day_part","lkp_day_part"]

source_columns_1:
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
source_columns_2:
    DW_STOREID: 'DW_STOREID'
    DW_BUSI_DAY: 'DW_TRANS_DAY'
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

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_models = metadata_dict['source_models'] %}

--create below set variables based on no of sources

{% set i = 0 %}


{% for model in source_models %}
 {% set i = loop.index %}
 
    {% set source_model = source_models[i-1] %}
    {% set derived_columns = metadata_dict['source_columns_' ~ loop.index|string] %}
    
    {% if i == source_models|length %}

    SELECT {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
    FROM {{ source_models[i-1] }} 
    {%- else -%} 
    SELECT {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} 
    FROM {{ source_models[i-1] }} 
    union all 
    {%- endif -%}
{% endfor %}

