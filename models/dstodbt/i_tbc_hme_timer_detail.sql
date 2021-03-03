{{ config(materialized='table') }}

SELECT * 
FROM {{ ref('dup_remove_hme_timer_detail') }} as  DUP_REMOVE_HME_TIMER_DETAIL