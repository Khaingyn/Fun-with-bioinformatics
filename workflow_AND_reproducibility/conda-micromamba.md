

## Các vấn đề từng gặp

- 1 môi trường micromamba chứa r-base tên A, sau đó active env A, gõ R và enter để vào console R. Chạy lệnh `R.home()` nhưng output ra path thư mục của env B:
  ```
  > R.home()
  [1] "/home/jojo/micromamba/envs/B/lib/R"
  ```
  hoặc lệnh `.libPaths()` cũng dẫn ra path của env B:
  
  ```
  > .libPaths()
  [1] "/home/jojo/micromamba/envs/B/lib/R/library"
  ```
  - Giải quyết: trước đó, tôi đã tạo 1 file `~/.Renviron` có hàng gán đường dẫn `/home/jojo/micromamba/envs/B/lib/R` cho biến `R_HOME`, giờ tôi xoá hàng đó đi, lưu file lại. Active lại env A, vào R     console, chạy lại 2 lệnh kia để kiểm tra xem trỏ tới thư mục của env A là thành công.
  - Đề xuất trước của chatgpt: kiểm tra các file cấu hình R khác như: `~/.Rprofile`, `~/.R/Makevars`, hoặc trong thư mục cài R `($R_HOME/etc/Rprofile.site)`. Check xem có dòng                           `.libPaths("/home/jojo/micromamba/envs/R4.4.1-q2/lib/R/library")` trong file `~/.Rprofile`, `~/.Renviron` thì xoá hoặc #comment nó. Ngoài ra có thể check path nhanh bằng lệnh `R -q -e                 "cat(R.home(), '\n'); print(.libPaths())"` khi đang active env A mà không cần phải vào R console cho tốn thời gian.
  - À đối với tạo môi trường micromamba/conda có r-base trên ubuntu, thì hiện tại (ngày tôi viết đoạn này 10/September/2025), bản r-base mới nhất có thể dùng được là r-base=4.4.* (mất nhất hiện tại     là 4.5.1), vì sự cập nhật version chậm của các package r khác trên các channel như conda-forge, nên version r-base cũng buộc phải dùng bản khpng6 phải mới nhất để phù hợp với các package r khác,     r-base trên channel conda-forge cũng đã có version 4.5.1. 
 

