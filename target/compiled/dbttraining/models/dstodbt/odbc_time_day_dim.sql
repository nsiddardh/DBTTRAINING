

SELECT  DISTINCT  DW_DAY, FIRST_VALUE(BUSIDAYDT) over(partition by dw_day order by dw_day) AS BUSIDAYDT
FROM TIME_DAY_DIM