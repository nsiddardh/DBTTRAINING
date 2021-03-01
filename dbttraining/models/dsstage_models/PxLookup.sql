{{ config(materialized='view') }}


{%- set yaml_metadata -%}

source_model: "lkp_day_part"
lkp_models: "odbc_time_day_dim, odbc_time_day_part"
lkp_columns: '{ "lkp_models": 
							{ 
								name: "odbc_time_day_dim" 
								columns: "DW_DAY,BUSIDAYDT"
                                condition: "lkp_day_part.business_date = odbc_time_day_dim.busidaydt"
							},
							{
								name: "odbc_time_day_part"
								columns: "DW_DAYPART,DAYPART_BGN_TM,DAYPART_END_TM"
                                condition: "lkp_day_part.business_date = odbc_time_day_dim.busidaydt"
							}
			  }'

lkp_conidtions: "a.business_date = b.busidaydt and a.dw_day = c.dw_day"

{% set my_json_str = '{"source_model": "lkp_day_part"}' %}
{% set my_dict = fromjson(my_json_str) %}

derived_columns:
    DW_DAY: "DW_BUSI_DAY"
    DW_DAYPART: "DW_DAYPART"
    STORE_ID: "STORE_ID"
    DW_STOREID: "DW_STOREID"
    BUSINESS_DATE: "BUSINESS_DATE"
    OPEN_TIME: "OPEN_TIME"
    CLOSE_TIME: "CLOSE_TIME"
    TRANSACTION_DATE: "TRANSACTION_DATE"
    TRANS_DATE_TXT: "TRANS_DATE_TXT"
    TRANSACTION_TIME: "TRANSACTION_TIME"
    GREET_DELAY: "GREET_DELAY"
    MENU_BOARD_DURATION: "MENU_BOARD_DURATION"
    QUEUE_DURATION: "QUEUE_DURATION"
    CASHIER_WINDOW_DURATION: "CASHIER_WINDOW_DURATION"
    BOOTH_QUEUE_DURATION: "BOOTH_QUEUE_DURATION"
    SERVICE_WINDOW_DURATION: "SERVICE_WINDOW_DURATION"
    TOTAL_BOOTH_DURATION: "TOTAL_BOOTH_DURATION"
    WAITING_AREA_DURATION: "WAITING_AREA_DURATION"
    TRANSACTION_TIME_LKP: "TRANSACTION_TIME_LKP"
    TOTAL_SPEED_OF_SERVICE_DURATION: "TOTAL_SPEED_OF_SERVICE_DURATION"
    LANE_NUMBER: "LANE_NUMBER"
    TBC_LANE: "TBC_LANE"

{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}
{% set lkp_models = metadata_dict['lkp_models'] %}
{% set lkp_conidtions = metadata_dict['lkp_conidtions'] %}



select {{ create_alias(  source_model=source_model,
                  derived_columns=derived_columns) }} from {{source_model}} , {{lkp_models }}

                  where {{lkp_conidtions}}
