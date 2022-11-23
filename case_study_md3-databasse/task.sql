-- task 2:
select 
  nhan_vien.ma_nhan_vien, 
  nhan_vien.ho_ten 
from 
  nhan_vien 
where 
  ho_ten like "H%" 
  or ho_ten like "T%" 
  or ho_ten like "T%" 
  and char_length(ho_ten) <= 15;

-- task 3:
select 
  khach_hang.ma_khach_hang, 
  khach_hang.ho_ten, 
  khach_hang.dia_chi 
from 
  khach_hang 
where 
  (
    dia_chi like "% Đà Nẵng" 
    or dia_chi like "% Quảng Trị"
  ) 
  and datediff(now(), khach_hang.ngay_sinh) / 365 >= 18 
  and datediff(now(), khach_hang.ngay_sinh)/ 365 <= 50;

-- task 4: 
select 
  hop_dong.ma_khach_hang, 
  khach_hang.ho_ten, 
  count(hop_dong.ma_khach_hang) AS so_lan_dat_phong 
from 
  khach_hang 
  join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
  join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
where 
  loai_khach.ten_loai_khach like "Diamond" 
group by 
  khach_hang.ma_khach_hang 
order by 
  count(hop_dong.ma_khach_hang);
  
  -- Task 5:
  select 
  khach_hang.ma_khach_hang, 
  khach_hang.ho_ten, 
  loai_khach.ten_loai_khach, 
  hop_dong.ma_hop_dong, 
  dich_vu.ten_dich_vu, 
  hop_dong.ngay_lam_hop_dong, 
  hop_dong.ngay_ket_thuc, 
  IFNULL(dich_vu.chi_phi_thue, 0) + IFNULL(hop_dong_chi_tiet.so_luong, 0) * IFNULL(dich_vu_di_kem.gia, 0) AS tong_tien 
from 
  khach_hang 
  left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
  left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
  left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu 
  left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong 
  left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
group by 
  khach_hang.ma_khach_hang;

-- task 6: 
select 
  dich_vu.ma_dich_vu, 
  dich_vu.ten_dich_vu, 
  dich_vu.dien_tich, 
  dich_vu.chi_phi_thue, 
  loai_dich_vu.ten_loai_dich_vu 
from 
  dich_vu 
  join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu 
  join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu 
where 
  hop_dong.ma_dich_vu not in (
    select 
      hop_dong.ma_dich_vu 
    from 
      hop_dong 
    where 
      (
        quarter(hop_dong.ngay_lam_hop_dong) IN (1) 
        and year(hop_dong.ngay_lam_hop_dong) = 2021
      )
  ) 
group by 
  dich_vu.ma_dich_vu;
  
  -- Task 7:
  select 
  dich_vu.ma_dich_vu, 
  dich_vu.ten_dich_vu, 
  dich_vu.dien_tich, 
  dich_vu.so_nguoi_toi_da, 
  dich_vu.chi_phi_thue, 
  loai_dich_vu.ten_loai_dich_vu 
from 
  dich_vu 
  join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu 
  join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu 
where 
  hop_dong.ma_dich_vu not in (
    select 
      hop_dong.ma_dich_vu 
    from 
      hop_dong 
    where 
      year(hop_dong.ngay_lam_hop_dong) = 2021
  ) 
  and hop_dong.ma_dich_vu in (
    select 
      hop_dong.ma_dich_vu 
    from 
      hop_dong 
    where 
      year(hop_dong.ngay_lam_hop_dong) = 2020
  ) 
group by 
  dich_vu.ma_dich_vu;
  
  -- Task 8: 
  -- cách 1:
select 
  distinct khach_hang.ho_ten 
from 
  khach_hang;

-- cách 2:
select 
  khach_hang.ho_ten 
from 
  khach_hang 
group by 
  khach_hang.ho_ten;

-- cách 3:
select 
  khach_hang.ho_ten 
from 
  khach_hang 
union 
select 
  khach_hang.ho_ten 
from 
  khach_hang;
  
-- Task 9:
select 
  month(hop_dong.ngay_lam_hop_dong) as thang, 
  count(hop_dong.ma_hop_dong) as so_luong_khach_hang 
from 
  hop_dong 
where 
  year(hop_dong.ngay_lam_hop_dong) = 2021 
group by 
  month(hop_dong.ngay_lam_hop_dong) 
order by 
  month(hop_dong.ngay_lam_hop_dong);

-- Task 10:
select 
  hop_dong.ma_hop_dong, 
  hop_dong.ngay_lam_hop_dong, 
  hop_dong.ngay_ket_thuc, 
  hop_dong.tien_dat_coc, 
  IFNULL(
    SUM(hop_dong_chi_tiet.so_luong), 
    0
  ) as so_luong_dich_vu_di_kem 
from 
  hop_dong 
  left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
group by 
  hop_dong.ma_hop_dong;
  
  -- Task 11:
  select 
  dich_vu_di_kem.ma_dich_vu_di_kem, 
  dich_vu_di_kem.ten_dich_vu_di_kem 
from 
  dich_vu_di_kem 
  join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
  join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong 
  join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang 
  join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
where 
  loai_khach.ten_loai_khach like "Diamond" 
  and (
    khach_hang.dia_chi like "% Vinh" 
    or khach_hang.dia_chi like "% Quảng Ngãi"
  ) 
group by 
  dich_vu_di_kem.ma_dich_vu_di_kem;
  
  -- Task 12:
  select 
  hop_dong.ma_hop_dong, 
  nhan_vien.ho_ten, 
  khach_hang.ho_ten, 
  khach_hang.so_dien_thoai, 
  dich_vu.ten_dich_vu, 
  ifnull(
    sum(hop_dong_chi_tiet.so_luong), 
    0
  ) as so_luong_dich_vu_di_kem, 
  hop_dong.tien_dat_coc 
from 
  hop_dong 
  right join nhan_vien on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien 
  right join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang 
  join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
  left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
where 
  hop_dong.ma_hop_dong in (
    select 
      hop_dong.ma_hop_dong 
    from 
      hop_dong 
    where 
      year(hop_dong.ngay_lam_hop_dong) = 2020 
      and quarter(hop_dong.ngay_lam_hop_dong) = 4
  ) 
  and hop_dong.ngay_lam_hop_dong not in (
    select 
      hop_dong.ngay_lam_hop_dong 
    from 
      hop_dong 
    where 
      year(hop_dong.ngay_lam_hop_dong) = 2021 
      and quarter(hop_dong.ngay_lam_hop_dong) in (1, 2)
  ) 
group by 
  hop_dong.ma_hop_dong;
  
  -- Task 13: 
  create view v_dich_vu_di_kem as 
select 
  dich_vu_di_kem.ma_dich_vu_di_kem, 
  dich_vu_di_kem.ten_dich_vu_di_kem, 
  ifnull(
    sum(hop_dong_chi_tiet.so_luong), 
    0
  ) as so_luong_dich_vu_di_kem 
from 
  dich_vu_di_kem 
  join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
  join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
group by 
  dich_vu_di_kem.ma_dich_vu_di_kem;
  
  select 
  * 
from 
  v_dich_vu_di_kem 
where 
  so_luong_dich_vu_di_kem = (
    select 
      max(so_luong_dich_vu_di_kem) 
    from 
      v_dich_vu_di_kem
  );
  
  -- Task 14: 
  select 
  hop_dong.ma_hop_dong, 
  loai_dich_vu.ten_loai_dich_vu, 
  dich_vu_di_kem.ten_dich_vu_di_kem, 
  count(
    hop_dong_chi_tiet.ma_dich_vu_di_kem
  ) as so_lan_su_dung 
from 
  hop_dong 
  join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
  join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu 
  join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
  join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem 
group by 
  hop_dong_chi_tiet.ma_dich_vu_di_kem 
having 
  count(
    hop_dong_chi_tiet.ma_dich_vu_di_kem
  ) = 1 
order by 
  hop_dong.ma_hop_dong;
  
  -- Task 15:
  select 
  nhan_vien.ma_nhan_vien, 
  nhan_vien.ho_ten, 
  trinh_do.ten_trinh_do, 
  bo_phan.ten_bo_phan, 
  nhan_vien.so_dien_thoai, 
  nhan_vien.dia_chi 
from 
  nhan_vien 
  join trinh_do on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do 
  join bo_phan on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan 
  join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien 
where 
  year(hop_dong.ngay_lam_hop_dong) in (2020, 2021) 
group by 
  nhan_vien.ma_nhan_vien 
having 
  count(hop_dong.ma_nhan_vien) <= 3 
order by 
  nhan_vien.ma_nhan_vien;
  
  -- Task 16:
  set sql_safe_updates = 0;
  
delete from 
  nhan_vien 
where 
  nhan_vien.ma_nhan_vien in (
    select 
      * 
    from 
      (
        select 
          nhan_vien.ma_nhan_vien 
        from 
          nhan_vien 
        where 
          nhan_vien.ma_nhan_vien not in (
            select 
              nhan_vien.ma_nhan_vien 
            from 
              nhan_vien 
              join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien 
            where 
              hop_dong.ma_nhan_vien in (
                select 
                  hop_dong.ma_nhan_vien 
                where 
                  year(hop_dong.ngay_lam_hop_dong) in (2019, 2020, 2021)
              ) 
            group by 
              nhan_vien.ma_nhan_vien
          )
      ) adc
  );
  
  -- Task 17: 
update khach_hang
set ma_loai_khach = 1
where ma_khach_hang in (select ma_khach_hang from (select khach_hang.ma_khach_hang, ifnull(dich_vu.chi_phi_thue, 0) + ifnull(hop_dong_chi_tiet.so_luong, 0) * ifnull(dich_vu_di_kem.gia, 0) as tong_tien
  from khach_hang
  left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
  left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
  left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
  left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong 
  left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
  where year(hop_dong.ngay_lam_hop_dong) = 2021 and loai_khach.ten_loai_khach like "Platinium"
  group by khach_hang.ma_khach_hang
  having tong_tien > 10000000) adc);