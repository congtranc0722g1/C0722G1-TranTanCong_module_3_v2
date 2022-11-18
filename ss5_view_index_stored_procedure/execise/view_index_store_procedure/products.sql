create database demo1;
use demo1;
create table products(
id int primary key,
product_code varchar(50),
product_name varchar(50),
product_price double,
product_amount int,
product_description longtext,
product_status varchar(50)
);

insert into products value (
  1, "sp001", "Cháo Ăn Liền", 3000, 
  50, "Gấu Đỏ", "tồn kho"
), 
(
  2, "sp002", "Mỳ Ăn Liền", 4000, 
  100, "3 Miền", "đang bán"
), 
(
  3, "sp003", "Bánh Gạo", 10000, 150, 
  "Hàn Quốc", "tồn kho"
), 
(
  4, "sp004", "Bia Tiger", 300000, 70, 
  "Tiger", "đang bán"
), 
(
  5, "sp005", "Sữa", 13000, 250, "Vinamilk ", 
  "tồn kho"
);
select * from products;

-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index i_product_code on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_products on products(product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select product_code from products;

-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view v_products as
select product_code, product_name, product_price, product_status 
from products;

-- sửa view:
create or replace view v_products as
select product_name, product_price, product_status
from products;

-- xóa view:

drop view v_products;

-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure sp_product()
begin
select *
from products;
end //
delimiter ;
call sp_product();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product (in p_id int, in p_product_code varchar(50), in p_product_name varchar(50), in p_product_price double, in p_product_amount int, in p_product_description longtext, in p_product_status varchar(50))
begin
insert into products 
value (p_id, p_product_code, p_product_name, p_product_price, p_product_amount, p_product_description, p_product_status);
end //
delimiter ;

call add_product(6, "sp006","Bánh Quy", "50000", 6, "ăn liền", "tồn kho");

