












select lkp_trans_dt.DW_BUSI_DAY AS DW_BUSI_DAY,
    lkp_trans_dt.DW_TRANS_DAY AS DW_TRANS_DAY,
    odbc_time_day_part.DW_DAYPART AS DW_DAYPART,
    lkp_trans_dt.STORE_ID AS STORE_ID,
    lkp_trans_dt.DW_STOREID AS DW_STOREID,
    lkp_trans_dt.BUSINESS_DATE AS BUSINESS_DATE,
    lkp_trans_dt.OPEN_TIME AS OPEN_TIME,
    lkp_trans_dt.CLOSE_TIME AS CLOSE_TIME,
    lkp_trans_dt.TRANSACTION_DATE AS TRANSACTION_DATE,
    lkp_trans_dt.TRANS_DATE_TXT AS TRANS_DATE_TXT,
    lkp_trans_dt.TRANSACTION_TIME AS TRANSACTION_TIME,
    lkp_trans_dt.GREET_DELAY AS GREET_DELAY,
    MENU_BOARD_DURATION AS MENU_BOARD_DURATION,
    lkp_trans_dt.QUEUE_DURATION AS QUEUE_DURATION,
    lkp_trans_dt.CASHIER_WINDOW_DURATION AS CASHIER_WINDOW_DURATION,
    lkp_trans_dt.BOOTH_QUEUE_DURATION AS BOOTH_QUEUE_DURATION,
    lkp_trans_dt.SERVICE_WINDOW_DURATION AS SERVICE_WINDOW_DURATION,
    lkp_trans_dt.TOTAL_BOOTH_DURATION AS TOTAL_BOOTH_DURATION,
    lkp_trans_dt.WAITING_AREA_DURATION AS WAITING_AREA_DURATION,
    lkp_trans_dt.TRANSACTION_TIME_LKP AS TRANSACTION_TIME_LKP,
    lkp_trans_dt.TOTAL_SPEED_OF_SERVICE_DURATION AS TOTAL_SPEED_OF_SERVICE_DURATION,
    lkp_trans_dt.LANE_NUMBER AS LANE_NUMBER,
    lkp_trans_dt.TBC_LANE AS TBC_LANE 
from lkp_trans_dt as lkp_trans_dt  


 
  
     left outer join odbc_time_day_part as odbc_time_day_part on 
      lkp_trans_dt.TRANSACTION_TIME_LKP BETWEEN odbc_time_day_part.DAYPART_BGN_TM AND odbc_time_day_part.DAYPART_END_TM
 
  
     left outer join odbc_time_day_dim as odbc_time_day_dim
     lkp_trans_dt.BUSINESS_DATE=odbc_time_day_dim.busidaydt


