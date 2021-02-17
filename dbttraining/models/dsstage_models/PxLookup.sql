{{ config(materialized='view') }}


{%- set yaml_metadata -%}
source_model: "lkp_day_part"
source_columns:
    STORE_ID: 'STORE_ID'
    DW_STOREID: 'DW_STOREID'
    BUSINESS_DATE: 'BUSINESS_DATE'
    OPEN_TIME: 'OPEN_TIME'
    CLOSE_TIME: 'CLOSE_TIME'
    TRANSACTION_DATE: 'TRANSACTION_DATE'
    TRANS_DATE_TXT: 'TRANS_DATE_TXT'
    TRANSACTION_TIME: 'TRANSACTION_TIME'
    GREET_DELAY: 'GREET_DELAY'
    MENU_BOARD_DURATION: 'MENU_BOARD_DURATION'
    QUEUE_DURATION: 'QUEUE_DURATION'
    CASHIER_WINDOW_DURATION: 'CASHIER_WINDOW_DURATION'
    BOOTH_QUEUE_DURATION: 'BOOTH_QUEUE_DURATION'
    SERVICE_WINDOW_DURATION: 'SERVICE_WINDOW_DURATION'
    TOTAL_BOOTH_DURATION: 'TOTAL_BOOTH_DURATION'
    WAITING_AREA_DURATION: 'WAITING_AREA_DURATION'
    TRANSACTION_TIME_LKP: 'TRANSACTION_TIME_LKP'
    TOTAL_SPEED_OF_SERVICE_DURATION: 'TOTAL_SPEED_OF_SERVICE_DURATION'
    LANE_NUMBER: 'LANE_NUMBER'
    TBC_LANE: 'TBC_LANE'

lkp_models: "odbc_time_day_dim,odbc_time_day_part"
lkp_columns:
    DW_DAY: 'DW_BUSI_DAY'
    DW_DAYPART: 'DW_DAYPART'

lkp_conidtions: ""

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set source_columns = metadata_dict['source_columns'] %}

{{source_columns}}

{% set lkp_columns = metadata_dict['lkp_columns'] %}

{{lkp_columns}}

{%- set derived_column_names = dbtvault.extract_column_names(derived_columns) -%}

{{ dbtvault.derive_columns(source_relation=source_model, columns=derived_columns) | indent(4) }}


{{source_columns}} + "," + {{lkp_columns}}