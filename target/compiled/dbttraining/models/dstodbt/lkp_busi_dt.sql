




select seq_hme_detail.STORE_ID AS STORE_ID,
    odbc_time_day_dim.DW_DAY AS DW_BUSI_DAY,
    seq_hme_detail.DW_STOREID AS DW_STOREID,
    seq_hme_detail.BUSINESS_DATE AS BUSINESS_DATE,
    seq_hme_detail.OPEN_TIME AS OPEN_TIME,
    seq_hme_detail.CLOSE_TIME AS CLOSE_TIME,
    seq_hme_detail.TRANSACTION_DATE AS TRANSACTION_DATE,
    seq_hme_detail.TRANS_DATE_TXT AS TRANS_DATE_TXT,
    seq_hme_detail.TRANSACTION_TIME AS TRANSACTION_TIME,
    seq_hme_detail.GREET_DELAY AS GREET_DELAY,
    MENU_BOARD_DURATION AS MENU_BOARD_DURATION,
    seq_hme_detail.QUEUE_DURATION AS QUEUE_DURATION,
    seq_hme_detail.CASHIER_WINDOW_DURATION AS CASHIER_WINDOW_DURATION,
    seq_hme_detail.BOOTH_QUEUE_DURATION AS BOOTH_QUEUE_DURATION,
    seq_hme_detail.SERVICE_WINDOW_DURATION AS SERVICE_WINDOW_DURATION,
    seq_hme_detail.TOTAL_BOOTH_DURATION AS TOTAL_BOOTH_DURATION,
    seq_hme_detail.WAITING_AREA_DURATION AS WAITING_AREA_DURATION,
    seq_hme_detail.TRANSACTION_TIME_LKP AS TRANSACTION_TIME_LKP,
    seq_hme_detail.TOTAL_SPEED_OF_SERVICE_DURATION AS TOTAL_SPEED_OF_SERVICE_DURATION,
    seq_hme_detail.LANE_NUMBER AS LANE_NUMBER,
    seq_hme_detail.TBC_LANE AS TBC_LANE 
from seq_hme_detail as seq_hme_detail 


     left outer join (select * from (select row_number() over(partition by  busidaydt  order by busidaydt ) as rnk,  
         *
      from odbc_time_day_dim)
      where rnk=1)  odbc_time_day_dim on 
      seq_hme_detail.BUSINESS_DATE=odbc_time_day_dim.busidaydt