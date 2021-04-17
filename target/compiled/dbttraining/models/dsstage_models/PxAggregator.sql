








with source_data as (
SELECT  TIMEZONE AS TIMEZONE,
    TZ_CNT AS TZ_CNT,
    ERS_CNT AS ERS_CNT,
    Ttl_ERS AS Ttl_ERS,
    CURR_TIME AS CURR_TIME,
    RUN_TIME AS RUN_TIME,
    sum(TBE_Recvd) AS TBE_Recvd
FROM i_tbc_hme_timer_detail as XFM_HME
group by TIMEZONE,TZ_CNT,ERS_CNT,Ttl_ERS,CURR_TIME,RUN_TIME
)

select * from source_data