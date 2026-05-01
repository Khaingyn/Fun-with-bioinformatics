# HPC (is master) and UPS
1. Install nut on hpc ubuntu
  ```
  sudo apt update
  sudo apt install nut nut-client nut-server -y
  ```

2. Check usb is connected with UPS
- Run this command before and after connect usb capable, to check which is USb from UPS
   ```
   lsusb
   ```
   
3. Config

- `ups.conf`
  ```
  sudo nano /etc/nut/ups.conf
  ```
  ```
  [ares_ups]
    driver = blazer_ser
    port = auto
    desc = "UPS Ares for HPC"
  ```

- `nut.conf`
  ```
  sudo nano /etc/nut/nut.conf
  ```
  ```
  MODE=standalone
  ```

- `upsd.users`
  ```
  sudo nano /etc/nut/upsd.users
  ```
  ```
  [upsmon_user]
    password = <mypassword>
    upsmon master
  ```

- `upsmon.conf`
  ```
  sudo nano /etc/nut/upsmon.conf
  ```
  ```
  MONITOR ares_ups@localhost 1 upsmon_user mypassword primary
  ```
  if you want add time shutdown after battery mode:
  ```
  # Bảo ông Bảo vệ (upsmon) gọi ông Trợ lý (upssched) khi có sự cố
  NOTIFYCMD /sbin/upssched

  # Ra lệnh: Khi mất điện (ONBATT) và khi có điện lại (ONLINE), hãy chạy lệnh EXEC
  NOTIFYFLAG ONBATT SYSLOG+WALL+EXEC
  NOTIFYFLAG ONLINE SYSLOG+WALL+EXEC
  ```

- `upssched.conf`
  ```
  sudo nano /etc/nut/upssched.conf
  ```
  ```
  # Nơi chứa file tạm để ông trợ lý làm việc
  CMDSCRIPT /usr/bin/upssched-cmd
  PIPEFN /var/lib/nut/upssched.pipe
  LOCKFN /var/lib/nut/upssched.lock

  # KỊCH BẢN:
  # 1. Nếu mất điện (ONBATT), đợi 30 giây rồi chạy lệnh "ups-shutdown"
  AT ONBATT * START-TIMER ups-shutdown 30

  # 2. Nếu có điện lại (ONLINE) trong vòng 30 giây đó, hủy lệnh "ups-shutdown" ngay
  AT ONLINE * CANCEL-TIMER ups-shutdown
  ```
  
4. Permission for USB port
  ```
  sudo nano /etc/udev/rules.d/99-nut-ups.rules
  ```
  ```
  # Cấp quyền cho chip Prolific
  SUBSYSTEM=="usb", ATTR{idVendor}=="067b", ATTR{idProduct}=="23a3", MODE="0666", GROUP="nut"
  SUBSYSTEM=="tty", ATTRS{idVendor}=="067b", ATTRS{idProduct}=="23a3", MODE="0666", GROUP="nut"
  ```

- Thêm user nut vào nhóm quản lý thiết bị ngoại vi. Cổng Serial trên Linux thuộc nhóm dialout. Jojo hãy cho user nut gia nhập nhóm này:
  ```
  sudo usermod -a -G dialout nut
  ```

5. activate and run
  ```
  # Cho phép dịch vụ tự chạy khi khởi động máy
  sudo systemctl enable nut-server nut-client

  # Khởi động dịch vụ ngay bây giờ
  sudo systemctl restart nut-server nut-client
  ```
- ép driver connect with UPS:
  ```
  sudo upsdrvctl start
  ```

- check
  ```
  sudo /lib/nut/blazer_ser -a ares_ups -u root
  ```

  or
  ```
  upsc ares_ups@localhost
  ```
  
  
  








