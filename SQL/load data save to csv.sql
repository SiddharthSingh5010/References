#Renaming Column
alter table siddharth.songs rename column `ï»¿Song` to `Song`;

#Creating Table 
create table Employees (
	emp_id int,
    name varchar(20),
    salary int);

#Inserting into Table
insert into Employees values
	(
	23,
    'Shashikant',
    30000), 
    (
    25,
    'Sadgi',
    60000),
    (
    45,
    'Rahul',
    45000);

#Loading a CSV File in MYSQL Server
create table UC7 (
	CUSTOMER_REQUEST_ID varchar(40),
    USER_ID varchar(40),
    RESPONDED_PRO_BOOKING  varchar(40),
    BDATE_FINAL TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/UCData.csv' INTO TABLE UC7
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#Writing SQL Query to a CSV File :
select * from ucdata order by BDATE_FINAL limit 10 into 
OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Out.csv' fields 
terminated by ',' enclosed by '"' lines terminated by '\n';