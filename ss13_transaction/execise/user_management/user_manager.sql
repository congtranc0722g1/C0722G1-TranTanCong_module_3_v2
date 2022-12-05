create database user_management_v2;
;
use user_management_v2;

 create table user_v2(
 id int auto_increment primary key,
 `name` varchar(45),
 email varchar(45),
 country varchar(45)
 );
 
 insert into user_v2 (`name`, email, country) value("Trần Tấn Công", "trantancong@gmail.com", "Việt Nam"), ("Trần Tấn A", "tranaa@gmail.com", "Lào");
 select * from user_v2;
 insert into user_v2 (`name`, email, country) value("Trần Tấn Công", "trantancong@gmail.com", "Việt Nam");