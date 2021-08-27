
{{ config(materialized='view') }}

select empid,empname,deptid from emp2


