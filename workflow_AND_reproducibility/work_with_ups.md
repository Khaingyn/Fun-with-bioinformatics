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
`ups.conf`
  ```
  sudo nano /etc/nut/ups.conf
  ```
  ```
  [ares_ups]
    driver = blazer_usb
    port = /dev/ttyUSB0
    vendorid = 067b
    productid = 23a3
    desc = "UPS Ares for HPC"
    # Nếu blazer_usb không chạy, hãy thử thay bằng: driver = nutdrv_qx
  ```

`nut.conf`
  ```
  sudo nano /etc/nut/nut.conf
  ```
  ```
  MODE=standalone
  ```

`upsd.users`
  ```
  sudo nano /etc/nut/upsd.users
  ```
  ```
  
  








