create table Professor(
	professor_id int primary key,
	professor_name varchar(100),
	department varchar(100),
	salary numeric,
	salary_level numeric,
	hiredate date
);

create table Student(
	student_id int primary key,
	student_name varchar(100),
	major varchar(100)
);

create table CoursE(
	course_id int,
	section_id int,
	professor_id int,
	course_name varchar(100),
	primary key (course_id, section_id), 
	foreign key (professor_id) references Professor(professor_id)
);

create table Enrollment(
	student_id int,
	course_id int,
	grade varchar(2),
	enrolled_at date,
	primary key (student_id, course_id),
	foreign key (student_id) references Student(student_id)
	--foreign key (course_id) references Course(course_id)
);











