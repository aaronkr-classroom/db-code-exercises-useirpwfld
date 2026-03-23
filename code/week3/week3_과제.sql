/*
[Entities]
- user
- item

[Properties]
[user]
- id			(VARHCAR(20))
- password 		(VARCHAR(20))
- nickname 		(VARCHAR(30))
- level 		(NUMERIC)
- joindate 		(DATE) 

[item]
- sword			(NUMERIC)
- book			(NUMERIC)
- money 		(NUMERIC)
*/

create table user1(
	id varchar(20),
	password varchar(20),
	nickname varchar(30),
	level numeric,
	joindate date
);
create table item(
	nickname varchar(20),
	sword varchar(10),
	money numeric
);
insert into user1 (id,password,nickname,level,joindate)
values  ('1','1','a',1,'2000-11-11'),
		('1a','12','b',2,'2000-11-12'),
		('1aa','13','c',3,'2000-11-13'),
		('1aaa','14','d',4,'2000-11-14'),
		('1aaaa','15','e',5,'2000-11-15');
insert into item (nickname, sword, money)
values	('a','firesword1','1000'),
		('b','firesword1','1400'),
		('c','firesword4','1500'),
		('d','firesword3','1200'),
		('e','firesword2','1400');
select * from user1;
select * from user1 order by id desc;
select * from user1 where id='1';

		
		

