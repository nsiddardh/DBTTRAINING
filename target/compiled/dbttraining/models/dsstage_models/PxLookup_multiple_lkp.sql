




select odbc_time_minute_det.DW_MINUTE AS DW_MINUTE,
    odbc_time_day_dim.DW_DAY AS DW_BUSI_DAY,
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
    lkp_busi_dt.TOTAL_SPEED_OF_SERVICE_DURATION AS TOTAL_SPEED_OF_SERVICE_DURATION,
    lkp_busi_dt.LANE_NUMBER AS LANE_NUMBER,
    lkp_busi_dt.TBC_LANE AS TBC_LANE 
from lkp_busi_dt as lkp_busi_dt 


     left outer join (select * from (select row_number() over(partition by  BUSIDAYDT  order by BUSIDAYDT ) as rnk,  
         *
      from odbc_time_day_dim)
      where rnk=1)  odbc_time_day_dim on 
     lkp_busi_dt.BUSINESS_DATE=odbc_time_day_dim.busidaydt
     left outer join (select * from (select row_number() over(partition by  minutetm  order by minutetm ) as rnk,  
         *
      from odbc_time_minute_det)
      where rnk=1)  odbc_time_minute_det on 
     lkp_busi_dt.OPEN_TIME=odbc_time_minute_det.minutetm