
---------Select max salary from table
select max(staff_sal) from staff_master;

-------Select records of staff having max salary from staff_master
select * from staff_master
where staff_sal=(select max(staff_sal) from staff_master);

-----second highest salary
select max(staff_sal) from staff_master
where staff_sal not in (select max(staff_sal) from staff_master);

-------select highest salary along with dept name
select a.staff_name , a.staff_sal ,b.dept_code, b.dept_name
from staff_master a, department_master b
where a.dept_code =b.dept_code and a.staff_sal =(select max(staff_sal) from staff_master);

--------------select highest salary of each dept

select a.staff_name , a.staff_sal ,b.dept_code, b.dept_name
from staff_master a, department_master b
where a.dept_code =b.dept_code and a.staff_sal in (select max(staff_sal) from staff_master group by dept_code);
