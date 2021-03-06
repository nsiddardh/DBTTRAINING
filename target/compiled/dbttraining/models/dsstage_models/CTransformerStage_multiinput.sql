

/* -------STAGE VARIABLES SECTION--------This section repeats for all output links in transformation stage-----*/




/* -------EXPRESSIONS AND TARGET COLUMNS ALIASING SECTION--------*/













select lkp_busi_dt.DW_BUSI_DAY AS DW_BUSI_DAY,
    odbc_time_day_dim.DW_DAY AS DW_TRANS_DAY,
    lkp_busi_dt.STORE_ID AS STORE_ID,
    lkp_busi_dt.DW_STOREID AS DW_STOREID,
    lkp_busi_dt.BUSINESS_DATE AS BUSINESS_DATE,
    lkp_busi_dt.OPEN_TIME AS OPEN_TIME,
    lkp_busi_dt.CLOSE_TIME AS CLOSE_TIME,
    lkp_busi_dt.TRANSACTION_DATE AS TRANSACTION_DATE,
    lkp_busi_dt.TRANS_DATE_TXT AS TRANS_DATE_TXT,
    lkp_busi_dt.TRANSACTION_TIME AS TRANSACTION_TIME,
    lkp_busi_dt.GREET_DELAY AS GREET_DELAY,
    lkp_busi_dt.MENU_BOARD_DURATION AS MENU_BOARD_DURATION,
    lkp_busi_dt.QUEUE_DURATION AS QUEUE_DURATION,
    lkp_busi_dt.CASHIER_WINDOW_DURATION AS CASHIER_WINDOW_DURATION,
    lkp_busi_dt.BOOTH_QUEUE_DURATION AS BOOTH_QUEUE_DURATION,
    lkp_busi_dt.SERVICE_WINDOW_DURATION AS SERVICE_WINDOW_DURATION,
    lkp_busi_dt.TOTAL_BOOTH_DURATION AS TOTAL_BOOTH_DURATION,
    lkp_busi_dt.WAITING_AREA_DURATION AS WAITING_AREA_DURATION,
    lkp_busi_dt.TRANSACTION_TIME_LKP AS TRANSACTION_TIME_LKP,
    (case when SERVICE_WINDOW_DURATION is null then TOTAL_SPEED_OF_SERVICE_DURATION else SERVICE_WINDOW_DURATION end) AS TOTAL_SPEED_OF_SERVICE_DURATION,
    TRIM(LANE_NUMBER) AS LANE_NUMBER,
    lkp_busi_dt.TBC_LANE AS TBC_LANE 
from lkp_busi_dt as lkp_busi_dt  


 
left outer join   odbc_time_day_dim as odbc_time_day_dim on  lkp_busi_dt.business_date = odbc_time_day_dim.BUSIDAYDT 

 
left outer join   odbc_time_day_dim as odbc_time_day_dim on  lkp_busi_dt.TRANSACTION_DATE = odbc_time_day_dim.BUSIDAYDT 


