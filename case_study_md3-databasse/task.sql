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
