{{ config(
    materialized='table',
    pre_hook = '{{ log("abc \'123\'", info=true) }}'
) }}
select {{pre_hook}} as id