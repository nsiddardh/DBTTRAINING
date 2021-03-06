

/* -------STAGE VARIABLES SECTION--------This section repeats for all output links in transformation stage-----*/




/* -------EXPRESSIONS AND TARGET COLUMNS ALIASING SECTION--------*/











SELECT DW_STOREID AS DW_STOREID,
    DW_BUSI_DAY AS DW_BUSI_DAY,
    DW_TRANS_DAY AS DW_TRANS_DAY,
    DW_DAYPART AS DW_DAYPART,
    OPEN_TIME AS OPEN_TIME_TXT,
    TRIM(CLOSE_TIME) AS CLOSE_TIME_TXT,
    TRANSACTION_TIME AS TRANS_TIME_TXT,
    GREET_DELAY AS GREET_DELAY_DUR_SEC,
    MENU_BOARD_DURATION AS MENU_BOARD_DELAY_DUR_SEC,
    QUEUE_DURATION AS QUEUE_DUR_SEC,
    CASHIER_WINDOW_DURATION AS CASHIER_WINDOW_DUR_SEC,
    BOOTH_QUEUE_DURATION AS BOOTH_QUEUE_DUR_SEC,
    SERVICE_WINDOW_DURATION AS SERV_WINDOW_QUEUE_DUR_SEC,
    TOTAL_BOOTH_DURATION AS TOT_BOOTH_DUR_SEC,
    WAITING_AREA_DURATION AS WAIT_AREA_DUR_SEC,
    (case when SERVICE_WINDOW_DURATION is null then TOTAL_SPEED_OF_SERVICE_DURATION else SERVICE_WINDOW_DURATION end) AS TOT_SOS_DUR_SECONDS,
    TRIM(LANE_NUMBER) AS DRIVE_THRU_LANE_NBRLANE_NUMBER,
    TBC_LANE AS TBC_LANE,
    'JOBNAME' AS CREATE_ID,
    CURRENT_TIMESTAMP AS CREATE_TMSTMP,
    'JOBNAME' AS UPDT_ID,
    CURRENT_TIMESTAMP AS UPDT_TMSTMP 
FROM lkp_day_part

    where  DW_STOREID is not null 