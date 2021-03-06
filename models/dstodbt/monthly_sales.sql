{{ config(materialized='view') }}

SELECT *
FROM monthly_emp_sales
