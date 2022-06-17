create database my_first_db;

drop database my_first_db;

use my_first_db;

create table dog(
name varchar(50),
breed varchar(80),
age int);

insert into dog(name, breed, age)
values ('Terror 2', 'Chihuahua', 2);

insert into dog(breed)
values ('Sausage witl legs') , ('Yorkshire terrier');

select name, breed, price from dog where name like 'Terror%' and price is not null;

drop table dog;

alter table dog
add column price decimal(4,2);

alter table dog
add column class varchar(50);
alter table dog
drop column class;

select * from dog;

update dog set price = 5.00, breed = 'Gigabulldog' where name = 'Terror 2'; 
update dog set price = 2.10;

alter table dog
drop column name;
alter table dog
add column name VARCHAR(50) NOT NULL;

alter table dog
modify column breed varchar(50) not null default 'Yellow terrier'  after name;
update dog set name = 'asdf' where age = 2; 
alter table dog
modify column name varchar(50) not null unique;


 drop table if exists dog2;
create table dog2(
name varchar(50),
breed varchar(80),
age int);

alter table dog2
add column id int NOT NULL Auto_increment,
add primary key (id);

alter table dog2
modify column id int not null Auto_increment first;
alter table dog2
modify column age int after name;
select * from dog2;

insert into dog2(name, breed, age)
values ('Terror 3', 'bulldog', 'very old boi');
update dog2 set age = 3 where name = 'Terror 3';

drop table dog3;
create table dog3(
id int NOT NULL Auto_increment,
name varchar(50) NOT NULL unique,
breed varchar(80) NOT NULL,
age int NOT NULL,
 primary key(id));
 
 select * from dog3; 
 delete from dog3 where id =2;
insert into dog3(name, breed, age)
values ('Horson','gigabulldog', 6);

select * from my_first_db.dog2;

create table driver(
id int not null auto_increment primary key,
name varchar(40) not null);

create table license(
id int not null auto_increment primary key,
penalty_points int not null default 0,
registration_number varchar(8) unique not null
);

alter table driver
add column license_id int unique,
add foreign key (license_id)
references license(id);

select * from driver;
select * from license;

insert into license(penalty_points, registration_number)
values (120, 'BC123123'), (110, 'AA001122'), (900, 'BORISINA');

insert into driver(name, license_id)
values ('Boris', 1), ('Ravshan', 2), ('Zhamshut', 3);

insert into license(penalty_points, registration_number)
values (400, 'BB110011');

alter table license
add column driver_id int,
add foreign key (driver_id)
references driver(id);

select driver.name, license.registration_number, license.penalty_points
 from license 
left join driver on driver.id = license.driver_id;

drop table driver;

create table pupil(
id int not null auto_increment primary key,
first_name varchar(20) not null,
last_name varchar(40) not null,
phone_number varchar(15) unique not null
);

drop table course;

create table course(
id int not null auto_increment primary key,
course_name varchar(50) not null,
length_hours int not null
);

select * from pupil;
select * from course;

create table pupil_course(
pupil_id int not null,
course_id int not null,
primary key(pupil_id, course_id),
foreign key (pupil_id)
references pupil(id),
foreign key (course_id)
references pupil(id)
);

create table bag(
id int not null auto_increment primary key,
color varchar(50) not null,
brand varchar(50) not null,
pupil_id int,
foreign key (pupil_id) 
references pupil(id)
);

