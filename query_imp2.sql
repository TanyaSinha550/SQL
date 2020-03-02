1) Find the second highest salary of an employee?

select max(salary) from emp
where salary not in (select max(salary) from emp);
or 
select max(salary) from emp
where salary < (select max(salary) from emp);

2) Display the highest payed employee in each department?

------select deptno,ename,sal from emp
where sal in (select max(sal) from emp group by deptno)

-------------select max(sal) from emp group by deptno--------------

select max(sal),deptno from emp group by deptno;

3) Display alternate records
---------Use subqueries and aliasing with rownum

select * from (select rownum r,empno,sal,ename from emp order by empno)
where mod(r,2)=0;


4)Display duplicate names

select ename,count(*) from emp
group by ename 
having count(*)>1;

-------select ename,count(*) from emp
group by ename 
having count(*)>1
order by count(*);

5) Pattern matching (name ends with M)

selet ename from emp
where ename LIKE '%M'

6) Display the Nth Row (n=4)

select * from (select rownum r, a.* from emp a)
where r=4;

select * from emp
where rownum <= 4
minus
select * from emp
where rownum<=3;

 
or the second highest salary
select * from (select rownum r,a.* from emp a order by sal desc)
where r=2;

7) Display the 2,3,7 th records

select * from (select rownum r,a.* from emp a)
where r in (2,3,7)

8) Demo of union clause
----Union removes duplicates values while comparing while Union All allows duplicates values while combining.

select city,country from sample1
union
select city,country from sample2;

9)  Display first and last row from the table

select * from (select rownum r,a.* from emp a)
where r=1 or r=(select count(*) from emp);

10) select last 2 rows

select * from emp 
where rownum < (select count(*) from emp)
minus
select * from emp
where rownum <= (select count(*)-2 from emp)

select * from (select rownum r,a.* from emp a)
where r>(select count(*)-2 from emp);



