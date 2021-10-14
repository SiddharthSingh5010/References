create table IF NOT EXISTS OCCUPATIONS (name varchar(20),occupation varchar(20)) ;
insert into OCCUPATIONS value
('Samantha','Doctor'),
('Julia','Actor'),
('Maria','Actor'),
('Meera','Singer'),
('Ashely','Professor'),
('Ketty','Professor'),
('Christeen','Professor'),
('Jane','Actor'),
('Jenny','Doctor'),
('Priya','Singer');
set @r1=0,@r2=0,@r3=0,@r4=0;
select min(Doctor), min(Professor), min(Singer), min(Actor) from
(
select 
case when occupation='Doctor' then name end as Doctor,
case when occupation='Actor' then name end as Actor,
case when occupation='Singer' then name end as Singer,
case when occupation='Professor' then name end as Professor,
case when occupation='Doctor' then @r1:=@r1+1
 when occupation='Actor' then @r2:=@r2+1
 when occupation='Singer' then @r3:=@r3+1
 when occupation='Professor' then @r4:=@r4+1 end as Row_Num from OCCUPATIONS order by name) temp group by Row_Num;