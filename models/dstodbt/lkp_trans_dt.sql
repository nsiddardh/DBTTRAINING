{{ config(materialized='view') }}

SELECT STORE_ID,DW_STOREID,BUSINESS_DATE,OPEN_TIME,CLOSE_TIME,TRANSACTION_DATE,
TRANS_DATE_TXT,TRANSACTION_TIME,GREET_DELAY,MENU_BOARD_DURATION,QUEUE_DURATION,
CASHIER_WINDOW_DURATION,BOOTH_QUEUE_DURATION,SERVICE_WINDOW_DURATION,TOTAL_BOOTH_DURATION,
WAITING_AREA_DURATION, TRANSACTION_TIME_LKP,
TOTAL_SPEED_OF_SERVICE_DURATION,LANE_NUMBER,TBC_LANE,DW_BUSI_DAY,
CP_TIME_DAY_DIM.DW_DAY AS DW_TRANS_DAY
FROM {{ ref('lkp_busi_dt') }} as LKP_BUSI_DT INNER JOIN {{ ref('odbc_time_day_dim') }} as CP_TIME_DAY_DIM ON  LKP_BUSI_DT.TRANSACTION_DATE = CP_TIME_DAY_DIM.BUSIDAYDT 