/*
[Entities]
- Professor

[Properties]
- id		(BIGSERIAL)
- name 		(VARCHAR(30))
- dept 		(VARCHAR(50))
- sal 		(NUMERIC)
- sal_level (NUMERIC)
- hiredate 	(DATE)  'yyyy-mm-dd' 
*/

create table prof(
	id bigserial,
	name varchar(30),
	dept varchar(50),
	sal numeric,
	sal_level numeric,
	hiredate date
);

table prof;

insert into prof (name, dept, sal, sal_level, hiredate) 
values ('김가','컴퓨터공학',11000,2,'2001-01-11'),
	   ('김나','게임',1020,1,'2002-03-15'),
	   ('김다','스포츠',101000,3,'2005-04-14'),
	   ('김라','국어',1400000,4,'2003-05-13'),
	   ('김마','영어',18000000,5,'2004-06-12');

----데이터 검색하기 
select * from prof;
select name, sal from prof;
select name, sal from prof order by sal desc; --asc
select name, sal from prof where sal > 90000;
select name, sal from prof where name like '김%'; -- postgresql ilike 대/소문자 상관 없음
select name,dept from prof where dept like '%공%' order by 2 desc;
select name,sal from prof where sal between 10000 and 90000;