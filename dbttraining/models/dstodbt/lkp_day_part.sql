{{ config(materialized='view') }}

SELECT LKP_TRANS_DT.* , ODBC_TIME_DAY_PART.DW_DAYPART
FROM {{ ref('lkp_trans_dt') }} as LKP_TRANS_DT INNER JOIN {{ ref('odbc_time_day_part') }} as ODBC_TIME_DAY_PART ON TRANSACTION_TIME_LKP BETWEEN DAYPART_BGN_TM AND DAYPART_END_TM