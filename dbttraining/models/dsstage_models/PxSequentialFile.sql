{{ config(materialized='view') }}

{%- set yaml_metadata -%}

source_table: "SRC_SEQ_HME_DETAIL"
source_columns: "STORE_ID,DW_STOREID,BUSINESS_DATE,OPEN_TIME,CLOSE_TIME,TRANSACTION_DATE,TRANS_DATE_TXT,TRANSACTION_TIME,GREET_DELAY,MENU_BOARD_DURATION,QUEUE_DURATION,CASHIER_WINDOW_DURATION,BOOTH_QUEUE_DURATION,SERVICE_WINDOW_DURATION,TOTAL_BOOTH_DURATION,WAITING_AREA_DURATION,TRANSACTION_TIME_LKP,TOTAL_SPEED_OF_SERVICE_DURATION,LANE_NUMBER,TBC_LANE"

        
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_columns = metadata_dict['source_columns'] %}
{% set source_table = metadata_dict['source_table'] %}

select {{ source_columns }} from {{ source_table }} 