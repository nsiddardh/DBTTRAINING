{{ config(materialized='view') }}

SELECT  DISTINCT DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT,
FIRST_VALUE(DW_BUSI_DAY) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS DW_BUSI_DAY,
FIRST_VALUE(DW_DAYPART) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS DW_DAYPART,
FIRST_VALUE(OPEN_TIME_TXT) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS OPEN_TIME_TXT,
FIRST_VALUE(CLOSE_TIME_TXT) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS CLOSE_TIME_TXT,
FIRST_VALUE(GREET_DELAY_DUR_SEC) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS GREET_DELAY_DUR_SEC,
FIRST_VALUE(MENU_BOARD_DELAY_DUR_SEC) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS MENU_BOARD_DELAY_DUR_SEC,
FIRST_VALUE(QUEUE_DUR_SEC) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS QUEUE_DUR_SEC,
FIRST_VALUE(CASHIER_WINDOW_DUR_SEC) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS CASHIER_WINDOW_DUR_SEC,
FIRST_VALUE(BOOTH_QUEUE_DUR_SEC) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS BOOTH_QUEUE_DUR_SEC,
FIRST_VALUE(SERV_WINDOW_QUEUE_DUR_SEC) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS SERV_WINDOW_QUEUE_DUR_SEC,
FIRST_VALUE(TOT_BOOTH_DUR_SEC) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS TOT_BOOTH_DUR_SEC,
FIRST_VALUE(WAIT_AREA_DUR_SEC) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS WAIT_AREA_DUR_SEC,
FIRST_VALUE(TOT_SOS_DUR_SECONDS) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS TOT_SOS_DUR_SECONDS,
FIRST_VALUE(DRIVE_THRU_LANE_NBR) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS DRIVE_THRU_LANE_NBR,
FIRST_VALUE(TBC_LANE) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS TBC_LANE,
FIRST_VALUE(CREATE_ID) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS CREATE_ID,
FIRST_VALUE(CREATE_TMSTMP) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS CREATE_TMSTMP,
FIRST_VALUE(UPDT_ID) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS UPDT_ID,
FIRST_VALUE(UPDT_TMSTMP) OVER(PARTITION BY DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT) AS UPDT_TMSTMP
FROM {{ ref('xfm_hme') }} as XFM_HME