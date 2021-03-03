{{ config(materialized='view') }}

{%- set yaml_metadata -%}

source_model: "i_tbc_hme_timer_detail"
dup_method: "first"
key_columns: "DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT"
derived_columns:
    DW_STOREID: 'DW_STOREID'
    DW_BUSI_DAY: 'DW_BUSI_DAY'
    DW_TRANS_DAY: 'DW_TRANS_DAY'
    DW_DAYPART: 'DW_DAYPART'
    OPEN_TIME_TXT: 'OPEN_TIME_TXT'
    CLOSE_TIME_TXT: 'CLOSE_TIME_TXT'
    TRANS_TIME_TXT: 'TRANS_TIME_TXT'
    GREET_DELAY_DUR_SEC: 'GREET_DELAY_DUR_SEC'
    MENU_BOARD_DELAY_DUR_SEC: 'MENU_BOARD_DELAY_DUR_SEC'
    QUEUE_DUR_SEC: 'QUEUE_DUR_SEC'
    CASHIER_WINDOW_DUR_SEC: 'CASHIER_WINDOW_DUR_SEC'
    BOOTH_QUEUE_DUR_SEC: 'BOOTH_QUEUE_DUR_SEC'
    SERV_WINDOW_QUEUE_DUR_SEC: 'SERV_WINDOW_QUEUE_DUR_SEC'
    TOT_BOOTH_DUR_SEC: 'TOT_BOOTH_DUR_SEC'
    WAIT_AREA_DUR_SEC: 'WAIT_AREA_DUR_SEC'
    TOT_SOS_DUR_SECONDS: "TOT_SOS_DUR_SECONDS"
    DRIVE_THRU_LANE_NBR: "DRIVE_THRU_LANE_NBR"
    TBC_LANE: "TBC_LANE"
    CREATE_ID: "CREATE_ID"
    CREATE_TMSTMP: 'CREATE_TMSTMP'
    UPDT_ID: 'UPDT_ID'
    UPDT_TMSTMP: 'UPDT_TMSTMP'


        
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set key_columns = metadata_dict['key_columns'] %}
{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}
{% set dup_method = metadata_dict['dup_method'] %}



with source_data as (
SELECT  DISTINCT {{ create_alias(  source_model=source_model, derived_columns=derived_columns) }}
, ROW_NUMBER() OVER (PARTITION BY {{key_columns}} order by {{key_columns}}) AS rn
FROM {{source_model}} as XFM_HME
)

select * from source_data WHERE rn = 1
