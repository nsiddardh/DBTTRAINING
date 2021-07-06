



SELECT deptid AS deptid,
    empid AS empid,
    max(sal) AS max_sal 
FROM emp
GROUP BY 
deptid, empid
    
