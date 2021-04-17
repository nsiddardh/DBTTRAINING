




with pivot_data as (
select distinct empid,nth_value(month, 1) over (partition by empid order by (select 1)) as month,nth_value(month, 2) over (partition by empid order by (select 1)) as month_1,nth_value(month, 3) over (partition by empid order by (select 1)) as month_2,nth_value(month, 4) over (partition by empid order by (select 1)) as month_3,nth_value(year, 1) over (partition by empid order by (select 1)) as year,nth_value(year, 2) over (partition by empid order by (select 1)) as year_1,nth_value(year, 3) over (partition by empid order by (select 1)) as year_2,nth_value(year, 4) over (partition by empid order by (select 1)) as year_3
 from monthly_sales
)

select empid AS emp_id,
    month AS month,
    Month_1 AS Month_1,
    Month_2 AS Month_2,
    Month_3 AS Month_3,
    year AS year,
    Year_1 AS Year_1,
    Year_2 AS Year_2,
    Year_3 AS Year_3 
from pivot_data