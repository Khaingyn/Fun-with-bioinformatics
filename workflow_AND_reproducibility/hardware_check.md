## Stress cpu and RAM
1. Install tool
   ```
   sudo apt update && sudo apt install stress-ng
   ```
2. Run stress test
   ```
   stress-ng --vm 16 --vm-bytes 80% --timeout 10m --metrics-brief
   ```
   `--vm`: number of threads
   `--vm-bytes`: ratio of memory
   `--timeout`: time of test

## Check Temperature: CPU, RAM, NVME
1. Install tool
   ```
   sudo apt update
   sudo apt install lm-sensors
   ```
2. Run detect
   ```
   sudo sensors-detect
   ```
   then, type `yes` for all questions. Finally, Enter
3. Run check temperture
   ```
   sensors
   ```
   Or view temperture realtime
   ```
   watch -n 1 sensors
   ```

## View HDD, SSD is installed
  ```
  lsblk
  ```
### View hard drive is formatted
```
df -h
```
