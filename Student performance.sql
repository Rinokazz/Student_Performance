create Database StudentPerformanceDB;
use StudentPerformanceDB;
create table StudentPerformance (id int auto_increment primary key,
gender enum( 'Female', 'Male'),
race_ethnicity enum('Hausa', 'Igbo','Yourba'),
math_score int,
reading_score int,
writting_score int);
insert into StudentPerformance(gender,race_ethnicity,
 math_score,reading_score, writting_score)
 select
 case when rand() < 0.5 then 'Female' else 'Male' end as gender,
 case
 when rand() < 0.33 then
 'Hausa'
 when rand() < 0.66 then
 'Igbo'
		else 'yourba'
	end as race_ethnicity,
    floor(rand() * 101) as
math_score,
    floor(rand() * 101) as
reading_score,
	floor(rand() * 101) as
writing_score
from
	(select 1 from information_schema.tables limit 1001)
    as temp;


select gender,
		avg(math_score) as
avg_math_score,
		avg(reading_score) as
avg_reading_score,
		avg(writting_score) as
avg_writting_score
from studentperformance
group by gender;

select race_ethnicity,
		avg(math_score) as
avg_math_score,
		avg(reading_score) as
avg_reading_score,
		avg(writting_score) as
avg_writting_score
from studentperformance
group by race_ethnicity;

select gender,
count(*) as total_students,
	avg(math_score) as
avg_math_score,
	avg(reading_score) as
avg_reading_score,
	avg(writting_score) as
avg_writting_score
from studentperformance
group by gender;


select race_ethnicity,
count(*) as total_students,
	avg(math_score) as
avg_math_score,
	avg(reading_score) as
avg_reading_score,
	avg(writting_score) as
avg_writting_score
from studentperformance
group by race_ethnicity;


