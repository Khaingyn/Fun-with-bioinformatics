# High performance computer (HPC)

## Quy trình sử dụng HPC (lần đầu)

**1. Tạo key**

**2. Truy cập vào HPC (server) từ máy tính cá nhân (local) bằng công cụ ssh**

**3. Submit job bằng công cụ slurm**


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
