# High performance computer (HPC)

## Quy trình sử dụng HPC (lần đầu)

**Bước 1. Tạo key**

**Bước 2. Truy cập vào HPC (server) từ máy tính cá nhân (local) bằng công cụ ssh**

```
ssh -i ~/.ssh/id_rsa username@server_address
```

**Bước 3. Submit job bằng công cụ slurm**

**->** Từ lần thứ 2 trở đi thì chỉ cần bắt đầu từ bước 2, không cần phải tạo key nữa.

## Chuyển dữ liệu giữa HPC, local và cloud với nhau
**1. Chuyển dữ liệu từ HPC sang local**
  - Lệnh scp (chạy trong terminal của local):
    ```bash
    scp -r username@server_address:/path/to/data_hpc /path/to/folder_local
    ```
    Trong đó, /path/to/data_hpc là đường dẫn tuyệt đối của thư mục hoặc file trên máy hpc mà bạn đang muốn chuyển sang local, /path/to/folder_local là đường dẫn tuyệt đối (hoặc đường dẫn tương đối) của thư mục trên local mà bạn đang muốn lưu.

  - Lệnh rsync (chạy trong terminal của local): Copy thư mục wgs_pen từ hpc về local, và ko copy thư mục data/ (folder con nằm trong wgs_pen), tại vị trí hiện tại chạy lệnh trên local sẽ có thư mục wgs_pen:
   ```bash
   rsync -av username@server_address:/mnt/10T2/huyha/preci/wgs_pen . --exclude='data/'
   ```
  - Lệnh rclone: copy folder "folder_download" về working directory hiện tại:
    ```bash
    rclone copy hpc2:/path/to/folder_download . -P --transfers 4 --checkers 8
    ```
  - khác:
    ```
    rclone copy hpc2:/mnt/data18tb/precigene/PGT-A/nf_pgta/ ./PGT-A_pipeline/pgta_pe/ \
      -P --transfers 12 \
      --checkers 24 \
      --exclude='clone_se/**' \
      --exclude='bwa/**'
    ```
    
**2. Tải data từ folder gg drive của người khác (đã được share truy cập)**
  - Tải các file nằm trong thư mục GTT_13.11.25/DATA/S250113192/ về thư mục hiện tại:
  ```
  rclone copy "ggdrive:GTT_13.11.25/DATA/S250113192" . --drive-shared-with-me --progress
  ```

  - Nên dùng folder ID sẽ dễ hơn và chính xác hơn, vì đôi khi có 2 folder được share với mình lại có cùng tên nhưng khác tài khoản.
    - Lấy ID của folder mong muốn

      1. Mở trình duyệt web và truy cập Google Drive.

      2. Vào mục "Shared with me" (Được chia sẻ với tôi).

      3. Mở folder "data" của tài khoản mà bạn muốn copy.

      4. Nhìn lên thanh địa chỉ (URL) của trình duyệt. Chuỗi ký tự lộn xộn phía sau cùng chính là Folder ID.

        Ví dụ URL là: https://drive.google.com/drive/u/0/folders/1A2b3C4d5E6f7G8h9I0j

        Thì ID là: 1A2b3C4d5E6f7G8h9I0j
      
      ```
      rclone copy "ggdrive:" . \
      --drive-root-folder-id 1A2b3C4d5E6f7G8h9I0j \
      --progress
      ```

  - Tải 1 file trong folder được share:
    ```
    rclone copy "ggdrive:file_A" . \
    --drive-root-folder-id 1A2b3C4d5E6f7G8h9I0j \
    --progress
    ```
    
  - Tải 2, 3 file trong folder được share:
    ```
    rclone copy "ggdrive:" . \
    --drive-root-folder-id 1A2b3C4d5E6f7G8h9I0j \
    --include "video1.mp4" --include "bao_cao.pdf" \
    --progress    
    ```
    
  - Tải nhiều file trong folder được share, dùng file danh sách:
    ```
    rclone copy "ggdrive:" . \
    --drive-root-folder-id 1A2b3C4d5E6f7G8h9I0j \
    --files-from list-file.txt \
    --progress  
    ```
    
    Trong *list-file.txt*, mỗi tên file là 1 dòng:
    ```
    video_tong_ket.mp4
    tai_lieu_2024.pdf
    hinh_anh/logo.png
    ```
    
    **Lưu ý quan trọng**
    Khi dùng ID, `rclone` coi cái ID đó là gốc của thư mục.  
    Nếu file nằm ngay trong folder đó -> Chỉ cần gõ tên file (`file.txt`).  
    Nếu file nằm trong thư mục con của folder đó -> Phải gõ kèm đường dẫn con (`subfolder/file.txt`).
    
## Thiết lập ssh giữa client và server, khi ở tỉnh thành xa, dùng tailscale
1. Cùng cài tailscale và run những lệnh sau trên cả máy client và server:
   ```bash
   #Install tailscale
   curl -fsSL https://tailscale.com/install.sh | sh

   #
   sudo tailscale up
   #Sau đó đăng nhập vào link website hiện lên sau dòng lệnh trên
   #Trên máy client và server đều phải đăng nhập cùng 1 tài khoản

   #Xem ip mới, cũng đều chạy trên client và server
   tailscale status
   ```
2. Từ IP có được từ lệnh `tailscale status`
   ```bash
   ssh <user_name>@<IP của server từ tailscale status>
   
## Một số lệnh hay dùng

### Xem dung lượng
- Xem dung lượng tổng của 1 thư mục: `du -sh /đường/dẫn/tới/thư_mục`

- Xem cpu, ram của tất cả job (tất cả user trong hpc) đang được submit:
  ```bash
  squeue -o "%.10i %.15u %.25j %.4C %.10m %.10M %.8T %.10P"
  ```
### tmux
- Tạo phiên làm việc mới (new session): `tmux new -s mywork`
- 
### Submit job
#### srun
```
srun --pty --job-name=khaipgta --cpus-per-task=4 --mem=8G --time=02:00:00 bash
```
#### 

## Lỗi từng gặp trong quá trình sử dụng

**sign_and_send_pubkey: signing failed for RSA ".ssh/id_rsa" from agent: agent refused operation
username@server_address: Permission denied (publickey).**
  - Phân quyền private key không phù hợp: ssh yêu cầu file private key (~/.ssh/id_sra) chỉ đọc bởi chủ sở hữu của nó (tức 1 username trên máy local), để phân lại quyền cho file này, dùng lệnh:
    ```
    chmod 600 ~/.ssh/id_sra
    ```
    Sau đó, ssh lại vào hpc như bình thường:
    ```
    ssh -i ~/.ssh/id_sra username@server_address
    ```
    Cách này cũng có thể áp dụng cho trường hợp: git clone một private repo của một tài khoản github A về máy local - bằng tài khoản github B mà đã được tài khoản github A mới vào đóng góp, bằng "địa chỉ ssh cho clone private repo về máy local":
    ```
    git clone git@github.com:user_name/repo_name.git
    ```
     nhưng không clone được. Sau khi phân quyền lại file id_sra thì đã clone lại được. 
