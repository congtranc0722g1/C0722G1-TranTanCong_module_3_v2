use furama_v2;

insert into customer_type(id,`name`)
value(1,'Diamond'),
	(2,'Platinium'),
	(3,'Gold'),
	(4,'Silver'),
	(5,'Member');
    
insert into customer(id,
`name`,date_of_birth,gender,id_card,phone_number,
email,address,customer_type_id)VALUE
(1,'Nguyễn Thị Hào','1970-11-07',0,'643431213',
'0945423362','thihao07@gmail.com',
'23 Nguyễn Hoàng, Đà Nẵng',5
),
(2,'Phạm Xuân Diệu','1992-08-08',1,'865342123',
'0954333333','xuandieu92@gmail.com',
'K77/22 Thái Phiên, Quảng Trị',3
),
(3,'Trương Đình Nghệ','1990-02-27',1,'488645199',
'0373213122','nghenhan2702@gmail.com',
'K323/12 Ông Ích Khiêm, Vinh',1
),
(4,'Dương Văn Quan','1981-07-08',1,'543432111',
'0490039241','duongquan@gmail.com',
'K453/12 Lê Lợi, Đà Nẵng',1
),
(5,'Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345',
'0312345678','nhinhi123@gmail.com',
'224 Lý Thái Tổ, Gia Lai',4
),
(6,'Tôn Nữ Mộc Châu','2005-12-06',0,'732434215',
'0988888844','tonnuchau@gmail.com',
'37 Yên Thế, Đà Nẵng',4
),
(7,'Nguyễn Mỹ Kim','1984-04-08',0,'856453123',
'0912345698','kimcuong84@gmail.com',
'K123/45 Lê Lợi, Hồ Chí Minh',1
),
(8,'Nguyễn Thị Hào','1999-04-08',0,'965656433',
'0763212345','haohao99@gmail.com',
'55 Nguyễn Văn Linh, Kon Tum',3
),
(9,'Trần Đại Danh','1994-07-01',1,'432341235',
'0643343433','danhhai99@gmail.com',
'24 Lý Thường Kiệt, Quảng Ngãi',1
),
(10,'Nguyễn Tâm Đắc','1989-07-01',1,'344343432',
'0987654321','dactam@gmail.com',
'22 Ngô Quyền, Đà Nẵng',2
);

delimiter //
create procedure delete_customer(in p_id int)
begin
delete from customer where id = p_id;
end //
delimiter ;

delimiter //
create procedure update_customer(in p_id int, in p_customer_type_id int, in p_name varchar(45),in p_date_of_birth date,in p_gender bit(1),in p_id_card varchar(45),in p_phone_number varchar(45),in p_email varchar(45), in p_address varchar(45))
begin
update customer
set customer_type_id = p_customer_type_id, `name`= p_name, date_of_birth = p_date_of_birth, gender = p_gender, id_card = p_id_card, phone_number = p_phone_number, email = p_email, address = p_address
where id = p_id;
end //
delimiter ;

select * from customer;

call update_customer(2, 1, "Trần Tấn ", "1999-10-20", 1, "909876546", "08888888888", "congtran@gmail.com", "Quảng Nam");