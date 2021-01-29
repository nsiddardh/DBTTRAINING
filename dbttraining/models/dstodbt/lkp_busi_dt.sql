
{%- set yaml_metadata -%}
--source_model: "raw_source"
src_column_list:
    is_hashdiff: true
    columns:
        - 'STORE_ID'
        - 'DW_STOREID'
        - 'BUSINESS_DATE'
        - 'OPEN_TIME'
        - 'CLOSE_TIME' 
        - 'TRANSACTION_DATE'
        - 'TRANS_DATE_TXT'
        - 'TRANSACTION_TIME' 
        - 'GREET_DELAY'
        - 'MENU_BOARD_DURATION'
        - 'QUEUE_DURATION'
        - 'CASHIER_WINDOW_DURATION'
        - 'BOOTH_QUEUE_DURATION'
        - 'SERVICE_WINDOW_DURATION'
        - 'TOTAL_BOOTH_DURATION'
        - 'WAITING_AREA_DURATION'
        - 'TRANSACTION_TIME_LKP'
        - 'TOTAL_SPEED_OF_SERVICE_DURATION'
        - 'LANE_NUMBER'
        - 'TBC_LANE'
lkp_column_list:
    columns:
        - 'DW_DAY'
source_tbl_join_field:
    columns:
        - 'BUSINESS_DATE'
lookup_tbl_join_field:
    columns:
        - 'BUSIDAYDT'
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set join_operator = '=' %}
{% set join_type = 'I' %}
{% set source_tbl_join_field = 'BUSINESS_DATE' %}
{% set lookup_tbl_join_field = 'BUSIDAYDT' %}

{% set source_columns = metadata_dict['src_column_list'] %}


{% set lkp_columns = metadata_dict['lkp_column_list'] %}


--{% set ranked_columns = metadata_dict['ranked_columns'] %}

 {{ config(materialized='view') }}

 {{ generate_lkp_query( ref('seq_hme_detail')  , ref('odbc_time_day_dim') , 
 'I', 
 join_operator, 
 source_tbl_join_field, 
 lookup_tbl_join_field ,    
 source_columns['columns'], 
 lkp_columns['columns']  ~ ' as DW_BUSI_DAY')    
 }}