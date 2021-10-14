create table maths (id int,marks int); 
create table science (id int, marks int); 
create table evs(id int,marks int);
insert into maths value (1,50),(2,35),(3,40),(5,60); 
insert into science value (1,40),(2,50),(4,60),(6,40); 
insert into evs value (1,20),(2,30),(3,40),(6,40),(8,34);
create table final_m as (
select M.id,M.marks as Maths,S.marks as Science,E.marks as EVS from Maths M left join Science S on S.id=M.id left join EVS E on E.id=M.id 
union 
select S.id, M.marks as Maths,S.marks as Science,E.marks as EVS from Science S left join EVS E on E.id=S.id left join Maths M on M.id=S.id 
union 
select E.id,M.marks as Maths, S.marks as Science,E.marks as EVS from EVS E left join Science S on S.id=E.id left join Maths M on M.id=E.id);
update final_m set Maths=0 where Maths is null;
update final_m set Science=0 where Science is null;
update final_m set EVS=0 where EVS is null;
select *,sum(maths+science+evs) as Total, sum(maths+science+evs)/3 as Average,
case when sum(maths+science+evs)>=100 then 'Good'
when sum(maths+science+evs)>=80 and sum(maths+science+evs)<100 then 'Moderate'
when sum(maths+science+evs)<80 then 'Bad' end as Grade from final_m group by id; 

drop table final_m;
drop table maths;
drop table evs;
drop table science;