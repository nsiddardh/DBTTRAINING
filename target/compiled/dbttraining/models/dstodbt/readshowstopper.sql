

select a.*,b.dw_day from TESTDBT.DBT_SNAMBURI.ers_dptbe_poll a left join TESTDBT.DBT_SNAMBURI.time_day_dim b
on date(processed_time) = b.busidaydt
where date(processed_time) = current_date