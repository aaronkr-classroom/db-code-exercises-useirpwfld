create database ut;

create table animals(
	id bigserial, 
	name varchar(20),
	age integer,
	kind varchar(20),
	dob date,
	location varchar(50)
);

table animals; -- select * from animals;

insert into animals (name, age, kind, dob, location) values ('cat',45,'tiger','2010-10-10','Seoul, Korea'),
															('cat1',4,'dog','2010-11-10','England'),
															('cat2',5,'cat','2010-12-10','USA'),
															('cat3',42,'bear','2011-10-10','Japan'),
															('cat4',2,'apple','2012-10-10','china');
select * from animals;


															