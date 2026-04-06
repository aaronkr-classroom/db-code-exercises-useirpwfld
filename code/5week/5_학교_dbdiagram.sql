Table Professor{
	professor_id int [pk]
	professor_name varchar
	department varchar
	salary numeric
	salary_level numeric
	hiredate date
}

Table Student{
	student_id int [pk]
	student_name varchar
	major varchar
}

Table CoursE{
	course_id int
	section_id int
	professor_id int
	course_name varchar
	indexes{
		(course_id, section_id) [pk]
	}
}

Table Enrollment{
	student_id int
	course_id int
	grade varchar(2)
	enrolled_at date
	indexes{
		(student_id, course_id) [pk]
	}
}

Ref: Enrollment.student_id > Student.student_id
Ref: CoursE.professor_id > Professor.professor_id











