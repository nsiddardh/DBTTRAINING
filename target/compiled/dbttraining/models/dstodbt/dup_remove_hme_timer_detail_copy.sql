




SELECT  DISTINCT DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT,
FIRST_VALUE(DW_BUSI_DAY) OVER w AS DW_BUSI_DAY,
FIRST_VALUE(DW_DAYPART) OVER w AS DW_DAYPART,
(etc etc)
FROM TESTDBT.DBT_SNAMBURI.xfm_hme as XFM_HME
WINDOW w AS (order by DW_STOREID,DW_TRANS_DAY,TRANS_TIME_TXT)