-- task 2:
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten
from nhan_vien
where ho_ten like "H%" or ho_ten like "T%" or ho_ten like "T%" and char_length(ho_ten) <= 15;

-- task 3:
select khach_hang.ma_khach_hang, khach_hang.ho_ten, khach_hang.dia_chi
from khach_hang
where (dia_chi like "% Đà Nẵng" or dia_chi like "% Quảng Trị") and datediff(now(), khach_hang.ngay_sinh) / 365 >= 18 and datediff(now(), khach_hang.ngay_sinh)/ 365 <= 50;

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
        month(hop_dong.ngay_lam_hop_dong) IN (1, 2, 3) 
        and year(hop_dong.ngay_lam_hop_dong) = 2021
      )
  ) 
group by 
  dich_vu.ma_dich_vu;