/*
-- 문화센터 예시
-- 릴레이션 스키마
	강사(강사번호(pk), 이름, 전문분야, 연락처)
	강좌(강좌번호(pk), 강좌명, 수강료, 최대인원, 강사번호(fk))
	회원(회원번호(pk), 이름, 전화번호, 가입일)
	수강신청(회원번호(fk)강좌번호(fk), 신청일)


-- 간단한 ERD
	강사 --- 1:N --- 강좌 --- N:M --- 회원

	강사 --- 1:N --- 강좌 --- 1:N --- 수강신청 --- 1:N --- 회원
*/

create table instructors(
	instructor_id int primary key, 
	name varchaR(30) not null,
	spesialty varchar(30),
	phone varchar(13)
);

create table classes(
	-- 최대 인원은 5~50명
	class_id int primary key,
	class_name varchar(50) not null,
	fee int check(fee>= 0),
	max_students int check (max_students between 5 and 50),
	instructor_id int, 
	foreign key (instructor_id) references instructors(instructor_id)
);

create table members (
	member_id int primary key,
	name varchar(30) not null,
	phone varchar(13),
	join_date date
);

create table registrations(
	member_id int,
	class_id int,
	register_date date,
	primary key(member_id, class_id),
	foreign key(member_id) references members(member_id) on delete cascade,
	foreign key(class_id) references classes(class_id) on delete cascade
);

insert into instructors values
(1, '김','요가','010-1111-1111'),
(2, '이','드로잉','010-2111-1111'),
(3, '박','영어회화','010-3111-1111');

insert into classes values
(101, '아침 요가', 50000, 20, 1),
(102, '수채화 기초', 70000, 15, 2),
(103, '영어 회화', 60000, 25, 3);

insert into members values
(1001, '홍', '010-2222-2222','2026-03-01'),
(1002,'최', '010-1222-2222','2026-04-01'),
(1003, '감', '010-0222-2222','2026-05-01');

insert into registrations values
(1001, 101, '2026-03-04'),
(1001,103,'2026-03-05'),
(1002,101,'2026-03-06'),
(1003,102,'2026-03-07');

--join
select m.name, c.class_name from registrations r 
join members m on r.member_id = m.member_id
join classes c on r.class_id = c.class_id;

--index
-- members에서 100,000명 추가
drop table members;
create table members2 (
	member_id serial primary key,
	name varchar(30) not null,
	phone varchar(13),
	join_date date
);

insert into members2(name, phone, join_date)
select 'Member_' || g, 
		'010-' || lpad((random()*9999)::int::text,4,'0') || '-' ||lpad((random()*9999)::int::text,4,'0'),
		current_date - ((random()*1000)::int)
		from generate_series(1,100000) g;

insert into members2(name, phone, join_date)
values ('홍', '010-1234-5678', current_date);

table members2;

-- 검색 시간 확인하기
explain analyze
select * from members2
where name = '홍';
-- planning time : 0.110ms  execution time:5.443ms

-- index 추가
create index idx_members2_name on members2(name);

explain analyze
select * from members2
where name = '홍';
-- planning time : 1.194 ms  execution time : 0.116ms

-- view 
create view registration_view as select m.name as 회원명, c.class_name as 강좌명, r.register_date as 신청일 from registrations r join members m on r.member_id=m.member_id join classes c on r.class_id = c.class_id;

select * from registration_view;