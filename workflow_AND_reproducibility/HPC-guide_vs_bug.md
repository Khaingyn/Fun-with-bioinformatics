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
  - Chạy lệnh scp trong terminal của local:
    ```
    scp -r username@server_address:/path/to/data_hpc /path/to/folder_local
    ```
    Trong đó, /path/to/data_hpc là đường dẫn tuyệt đối của thư mục hoặc file trên máy hpc mà bạn đang muốn chuyển sang local, /path/to/folder_local là đường dẫn tuyệt đối (hoặc đường dẫn tương đối) của thư mục trên local mà bạn đang muốn lưu.
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
