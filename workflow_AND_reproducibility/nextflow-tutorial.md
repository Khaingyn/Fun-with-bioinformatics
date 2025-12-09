- **View các folder output trong "work" của các quy trình cũ.**
  - Ví dụ quy trình mới:
    ```
    jojo@jojo-PC:/media/jojo/catwalk/training/hello-nextflow$ nextflow run hello-containers.nf -resume
  
    N E X T F L O W   ~  version 25.10.0
  
    Launching `hello-containers.nf` [boring_montalcini] DSL2 - revision: 0bf4876fd2
  
    executor >  local (1)
    [e0/9a613d] sayHello (2)       [100%] 3 of 3, cached: 3 ✔
    [f2/6d5d98] convertToUpper (2) [100%] 3 of 3, cached: 3 ✔
    [d0/4c6cc4] collectGreetings   [100%] 1 of 1, cached: 1 ✔
    [85/73c850] cowpy              [100%] 1 of 1 ✔
    There were 3 greetings in this batch
    ```
    Quy trình mới này có tên "boring_montalcini" (xem ngay hàng Launching ......).
  - Run:
    ```
    nextflow clean -before boring_montalcini -n
    ```
  - Output:
    ```
    jojo@jojo-PC:/media/jojo/catwalk/training/hello-nextflow$ nextflow clean -before boring_montalcini -n
    Would remove /media/jojo/catwalk/training/hello-nextflow/work/47/212f3d5640a16d30b81225dd781baf
    Would remove /media/jojo/catwalk/training/hello-nextflow/work/08/8f2a48c6e52e79754dd49eb9293a6a
    Would remove /media/jojo/catwalk/training/hello-nextflow/work/d5/1f0e08780b470def191728ed16d3d1
    ```
- **Xoá các folder output trong "work" của các quy trình cũ.**
  ```
  nextflow clean -before boring_montalcini -f
  ```
  - output:
  ```
  jojo@jojo-PC:/media/jojo/catwalk/training/hello-nextflow$ nextflow clean -before boring_montalcini -f
  Removed /media/jojo/catwalk/training/hello-nextflow/work/47/212f3d5640a16d30b81225dd781baf
  Removed /media/jojo/catwalk/training/hello-nextflow/work/08/8f2a48c6e52e79754dd49eb9293a6a
  Removed /media/jojo/catwalk/training/hello-nextflow/work/d5/1f0e08780b470def191728ed16d3d1
  ```
  cái này nhanh hơn:
  ```
  nextflow clean -f -but $(nextflow log -q | tail -n1)
  ```
- **Chạy 1 workflow với 1 file json lưu trữ các tham số của workflow**
  khi 1 lệnh chạy netxflow có quá nhiều tham số (có thể dùng cách khác là paste toàn bộ lệnh lext run với các tham số vào 1 file .sh, sau đó run run file này), dùng -params-file
  ```
  nextflow run hello-config.nf -params-file test-params.json
  ````
  - Trong đó, file test-params.json, có dạng json, 1 ví dụ:
    ```
    {
    "greet": "greetings.csv",
    "batch": "Trio",
    "character": "milk"
    }
    ```



