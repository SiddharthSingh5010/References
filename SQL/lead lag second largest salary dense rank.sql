create table emp1
  (
       EmpCode VARCHAR(10),
       EmpName   VARCHAR(10),
       JoiningDate  DATE,
       Salary float
    );

INSERT INTO emp1 VALUES ('1', 'Rajendra', str_to_date('01-09-2018','%d-%m-%Y'),23000);
INSERT INTO emp1 VALUES ('2', 'Manoj', str_to_date('03-07-2018','%d-%m-%Y'),34000);
INSERT INTO emp1 VALUES ('3', 'Sonu', str_to_date('10-03-2018','%d-%m-%Y'),45000);
INSERT INTO emp1 VALUES ('4', 'Kashish', str_to_date('25-Oct-2018','%d-%M-%Y'),34000);
INSERT INTO emp1 VALUES ('5', 'Tim', str_to_date('1-Dec-2018','%d-%M-%Y'),27000);
INSERT INTO emp1 VALUES ('6', 'Akshita', str_to_date('1-Nov-2018','%d-%M-%Y'),19000);

#Find Third largest salary in table (No employee details required)
select distinct salary from emp1 order by salary desc limit 2,1;

#Find Employee Names with second largest salary in table (when multiple employee can have same salaries)
#In this case, Manoj and Kashish both have second largest salary.
with TT as (select *,dense_rank() over (order by salary desc) Rnk from emp1)
SELECT EmpCode,EmpName,JoiningDate,Salary FROM TT where TT.Rnk=2;

SELECT *, 
       Lead(JoiningDate, 1) OVER(ORDER BY JoiningDate ASC) AS EndDate,
       Lag(EmpName, 1) OVER(ORDER BY JoiningDate ASC) AS EndDate
FROM emp1;

drop table emp1;