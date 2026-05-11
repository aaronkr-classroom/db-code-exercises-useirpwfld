create table users(
	user_id int primary key,
	user_name varchar(30) not null,
	nickname varchar(30) not null,
	user_level int,
	join_date date
);
create table games(
	game_id int primary key,
	game_name varchar(50) not null,
	genre varchar(20),
	release_date date
);
create table items(
	item_id int primary key,
	item_name varchar(30),
	price int,
	grade char
);
create table plays(
	user_id int,
	game_id int,
	start_date date,
	play_time int,
	primary key (user_id, game_id),
	foreign key (user_id) references users(user_id),
	foreign key (game_id) references games(game_id)
);
create table userItems(
	user_id int,
	item_id int,
	acquired date,
	quantity int,
	primary key (user_id, item_id),
	foreign key (user_id) references users(user_id),
	foreign key (item_id) references items(item_id)
);

table users; table games; table items; table plays; table userItem;

insert into users values
(1,'김민준','qweqwrq',10,'2024-04-01'),
(5,'김민준1','4qweqwrq',10,'2024-04-01'),
(4,'김민준2','3qweqwrq',10,'2024-04-01'),
(3,'김민준3','2qweqwrq',10,'2024-04-01'),
(2,'김민준4','1qweqwrq',10,'2024-04-01');

insert into games values
(101, '123','123','2020-02-02'),
(104, '13','128','2020-02-02'),
(102, '153','163','2020-02-02'),
(103, '163','113','2020-02-02');

insert into items values
(1001,'1qewq',4000,'1'),
(1002,'2qewq',7000,'2'),
(1003,'3qewq',6000,'3'),
(1004,'4qewq',5000,'4');

insert into plays values
(1,101,'2024-04-23'120),
(2,102,'2024-04-23'120),
(3,103,'2024-04-23'120),
(4,104,'2024-04-23'120);

select * from users;
select * from users order by user_level desc;
select * from users wjere iser_level >=10;
select * from items where grade='1';

alter table users add column email varchar(50);
alter table usres add column status varchar(10) default 'offline';
alter table items add column is_sellabel boolean default true;
alter table games add column age_rating varchar(10);

update users set email='min1231@123' where user_id = 1;
update users set level =25 where user_id = 2;
update users set status = 'online';
update users set status = 'connecting' where nickname = 'qwerqwrq';
update items set price=700 where item_name = '1qewq';
update games set age_rating = '12+' where game_id = 102;

