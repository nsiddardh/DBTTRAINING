{{ config(materialized='view') }}

SELECT  dw_minute
       , dw_currentflag
       , dw_daypart
       , dw_hour
       , daypartname
       , daypartbgntm
       , daypartendtm
       , hourno
       , hourbgntm
       , hourendtm
       , minuteno
       , minutetm
FROM time_minute_dim