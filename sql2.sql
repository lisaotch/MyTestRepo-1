create database testdb;

use testdb;

create table dog (
name varchar(50),
age int);

create table student (
id int not null AUTO_INCREMENT,
firstName varchar(50) not null,
lastName varchar(50) not null,
primary key (id));

select * from student;

CREATE TABLE ticket (
  ticketId INT NOT NULL AUTO_INCREMENT,
  ticketNumber VARCHAR(45) NOT NULL,
  studentId INT NOT NULL unique,
  PRIMARY KEY (ticketId),
  FOREIGN KEY (studentId)
    REFERENCES testdb.student (id));

CREATE TABLE ticket_alt (
  id INT NOT NULL AUTO_INCREMENT,
  ticketNumber VARCHAR(45) NOT NULL,
  studentId INT NOT NULL,
  PRIMARY KEY (`id`));
    
insert into student (firstName, lastName)
values ('Andrii', 'Sereda'), ('Oksana', 'Piatnycia');    
insert into student (firstName, lastName)
values ('Oleh', 'Buhai');

insert into ticket (ticketNumber, studentId)
values ('AA001', 1), ('AA002', 2);

insert into ticket (ticketNumber, studentId)
values ('AA003', 3);

insert into ticket_alt (ticketNumber, studentId)
values ('AA001', 1), ('AA002', 2),('AA003', 3);

select * from ticket_alt;

delete from ticket_alt where studentId =3;

select * from course;

drop table ticketAlt;

CREATE TABLE course (
  id INT NOT NULL AUTO_INCREMENT,
  courseName VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
CREATE TABLE professor (
  id INT NOT NULL AUTO_INCREMENT,
  firstName varchar(50) not null,
  lastName varchar(50) not null,
  PRIMARY KEY (`id`));
  
alter table course
add professorId int,
add foreign key (professorId)
references professor(id);

CREATE TABLE student_course (
  studentId INT NOT null,
  courseId INT NOT NULL,
  primary key(studentId, courseId),
  foreign key (studentId)
  references student(id),
  foreign key (courseId)
  references course(id));

insert into course (courseName)
values ('Java'), ('Salesforce'), ('C#');

insert into student_course (studentId,courseId)
values (1, 1), (2, 1), (2, 2);

insert into professor (firstName, lastName)
values ('Janusz', 'Kowalski'), ('Mario', 'Luigison');

update course set professorId = 1 where courseName = 'Java';

select * from professor left join course on professor.id = course.professorId;
select * from professor right join course on professor.id = course.professorId;
select * from professor inner join course on professor.id = course.professorId;

select count(*) as cnum from student_course group by courseId;
select c.courseName, count(*) 
from student_course as sc
join course as c on c.id = sc.courseId
 where count(*)>1
 group by courseId
--  having count(*) > 1
 order by count(*) DESC;

insert into student_course (studentId,courseId)
values (3, 1), (3, 2), (3, 3);

drop schema testdb;