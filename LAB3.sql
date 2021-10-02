--------------------1---------------------
--a--
select * from course
where credits > 3;

--b--
SELECT room_number from classroom
where building = 'Watson' or building ='Packard';


--c--
select * from course
where dept_name = 'Comp. Sci.';

--d--
SELECT course_id from section
where semester = 'Fall';

--e--
select * from student
where tot_cred > 45 and tot_cred < 90;

--f--
SELECT name from student
where name like '%a'or name like '%e' or name like '%i' or name like '%o' or name like '%u' or name like '%A'or name like '%E' or name like '%I' or name like '%O' or name like '%U';

--g--
select * from prereq
where prereq_id like 'CS-101';

--------------------2---------------------
--a--
select dept_name, avg(salary) as average_salary from instructor
group by dept_name;

--b--


--c--
select dept_name,min(count_course_id)
from (select dept_name,count(course_id) as count_course_id from course group by dept_name) as foo
group by foo.dept_name;

--d--
SELECT s.id, s.name, t.course_id
from takes t, student s
where s.dept_name = 'Comp. Sci.' and (select count(course_id) from takes) > 3
group by s.id, s.name, t.course_id;


--e--
select dept_name from instructor
where dept_name = 'Biology' or dept_name = 'Philosophy' or dept_name = 'Music';

--f--
select a.id, b.name, a.year from teaches a ,instructor b
where a.year = 2017 and a.id not in(select a.id from teaches where a.year = 2018) ;

--------------------3---------------------
--a--
select id,course_id,grade from takes
where course_id like '%CS-%' and (grade = 'A' or grade = 'A-');

--b--


--c--
select distinct(id) ,course_id,grade from takes
where grade = 'A' or grade = 'A+' or grade = 'A-' or grade = 'B' or grade = 'B+' or grade = 'B-';

--d--


--e--
select course_id, time_slot.end_hr
from section, time_slot
where section.time_slot_id = time_slot.time_slot_id and end_hr<13;