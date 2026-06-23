# Resource manager
## Thiết lập slurm cho user mới tạo
- Kiểm tra xem user có được gán account slurm:
  ```
  sacctmgr show user khainguyen
  ```
- Xem danh sách Account đang tồn tại trên hệ thống
  ```
  sacctmgr show account
  ```
  terminal:
  ```
     Account                Descr                  Org 

  ---------- -------------------- -------------------- 

   default      default account              default 

      root default root account                 root  
  ```
  1 account giống như 1 nhóm, có thể gán nhiều user cho 1 account slurm

- Gán account cho 1 user
  ```
  sudo sacctmgr add user khainguyen account=root
  ```

- Check lại:
  ```
  sacctmgr show user khainguyen
  ```
  
  
