create table Customer(
	customer_id int primary key,
	name varchar(100),
	phone varchar(13),
	address varchar(100)
);

create table Restaurant(
	restaurant_id int primary key,
	name varchar(100),
	phone varchar(13),
	address varchar(100)
);

create table Orders(
	order_id int primary key,
	customer_id int,
	restaurant_id int,
	order_date timestamp,
	total numeric,
	foreign key (customer_id) references Customer(customer_id),
	foreign key (restaurant_id) references Restaurant(restaurant_id)
);

create table Delivery(
	delivery_id int primary key,
	order_id int,
	driver_name varchar(100),
	status int,
	foreign key (order_id) references Orders(order_id)
);

insert into Customer values
(1, 'alice','010-1111-1111','충주'),
(2, '김수민', '010-2222-2222','청주');

insert into Restaurant values
(1, 'pizza place', '010-8888-8888','세종'),
(2, 'chiken place', '010-4546-8645','전주');

insert into Orders values
(1,1,1,'2026-04-13 15:15:00','22000'),
(2,2,2,'2026-04-13 10:10:00','2340');

insert into Delivery values
(1,1,'qwefw123r',1),
(2,2,'asfdqwr1',2);

select * from Orders;
select * from Orders order by total desc;
select * from Orders where total >= 10000;
select * from Delivery where status = 2;