

SELECT STORE_ID,DW_STOREID,BUSINESS_DATE,OPEN_TIME,CLOSE_TIME,TRANSACTION_DATE,
TRANS_DATE_TXT,TRANSACTION_TIME,GREET_DELAY,MENU_BOARD_DURATION,QUEUE_DURATION,
CASHIER_WINDOW_DURATION,BOOTH_QUEUE_DURATION,SERVICE_WINDOW_DURATION,TOTAL_BOOTH_DURATION,
WAITING_AREA_DURATION, TRANSACTION_TIME_LKP,
TOTAL_SPEED_OF_SERVICE_DURATION,LANE_NUMBER,TBC_LANE,DW_BUSI_DAY,
 DW_TRANS_DAY
FROM TESTDBT.DBT_SNAMBURI.lkp_trans_dt 
where DW_TRANS_DAY is null