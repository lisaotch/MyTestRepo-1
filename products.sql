SELECT * FROM my_first_db.products;

create table products (
id int not null Auto_increment,
name varchar(30) not null,
price int not null,
primary key(id));

insert into products(name,price)
values ('dress', 100), ('hat',30),('jeans', 120),('Asus', 20000),('Apple_Macbook',37000),('Cat',20),('Car',38);

select * from products;