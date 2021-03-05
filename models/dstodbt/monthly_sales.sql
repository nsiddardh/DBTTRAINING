{{ config(materialized='view') }}

SELECT *
FROM montly_sales
