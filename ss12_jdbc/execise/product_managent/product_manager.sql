create database product_v2;
use product_v2;
create table product(
id int auto_increment primary key,
`name` varchar(45),
price double,
`describe` varchar(45),
company varchar(45)
);

insert into product (`name`, price, `describe`, company) value ("Mỳ Ăn Liền", 3000, "Ăn liên", "Acecook"), ("Sữa", 13000, "Sô cô la", "TH TrueMilk"), ("Xe Máy", 7000000, "Vario 150", "HonDa");
select * from product;