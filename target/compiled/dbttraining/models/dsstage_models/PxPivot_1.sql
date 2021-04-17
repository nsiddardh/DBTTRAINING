











with pivot_data as (
select distinct empid

    
    ,nth_value(month, 1) over (partition by empid order by (select 1)) as month
     

     


     

    
    
    ,nth_value(month, 2) over (partition by empid order by (select 1)) as month_1
     


     

    
    
    ,nth_value(month, 3) over (partition by empid order by (select 1)) as month_2
     


from monthly_sales
)

select empid AS emp_id,
    Month AS Month_1,
    Month_1 AS Month_2,
    Month_2 AS Month_3 
from pivot_data