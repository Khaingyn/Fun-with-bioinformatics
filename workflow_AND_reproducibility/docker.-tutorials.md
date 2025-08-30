# Docker

## Nguyên lý khi build Docker container từ Docker image

Khi chạy lệnh ```docker build```, Docker daemon sẽ copy toàn bộ nội dung trong thư mục được dẫn tới (mà chứa file **Dockerfile**) trong dòng lệnh vào một cái không gian riêng cho công cụ Docker - gọi là **build context**, sau đó daemon nó mới copy những thứ trong **build context** vào trong image khi build (nếu những thứ đó được yêu cầu copy trong **Dockerfile**). Như vậy nếu những file, folder được yêu cầu copy vào image mà được ghi trong file **.dockerignore**, thì khi build Docker image sẽ bị lỗi. Daemon sẽ copy nội dung trong **build context** vào image (theo yêu cầu trong **Dockerfile**, chứ nó không truy cập vào ổ cứng của máy tính được để mà copy thẳng từ ổ cứng vào image, đây là copy gián tiếp.

## Thao tác với Docker image

- Liệt kê các image:
  ```
  docker images
  ```
- Xoá 1 image:
  ```
  docker rmi <image_id_or_name>
  ```
  Nếu bị báo lỗi "image is being used by container" thì phải xoá container trước:
  ```
  docker rm <container_id>
  docker rmi <image_id>
  ```
  --> Vì Docker không cho phép xoá image vì hiện đang có ít nhất một container (đang chạy hoặc đã dừng) được tạo từ image đó.
- Xoá 1 image cưỡng bức (chỉ dùng khi bạn không còn quan tâm các container đang chạy hay đã dừng mà được khởi tạo từ image đang muốn xoá):
  ```
  docker rmi -f <image_id>
  ```
- Tạo image từ file **Dockerfile**:
  ```
  docker build -t user_name/image_name:tag path/to/Dockerfile
  ```
  Trong đó,
  - user_name: nên đặt trùng với user_name của tài khoản docker hub (1 trang web lưu trữ Docker image giống như GitHub lưu trữ code, có tạo repo) để thuận tiện cho việc đưa image lên DockerHub (dùng lệnh ```docker pull```) sau này.
  - image_name: tên của Docker image đó.
  - tag: như là 1 chú thích gì đó tuỳ bạn, nếu không đặt ':tag' thì docker tự gán tag là 'latest' (dùng lệnh ```docker images``` để liệt kê các image đã tạo trong local, xem cột "TAG" sẽ thấy).
  - path/to/Dockerfile: là đường dẫn tới thư mục chứa file **Dockerfile** (không nhất thiết dẫn tới tên file của **Dockerfile** trừ khi bạn đặt tên khác, chỉ cần dẫn tới thư mục chứa **Dockerfile**, Docker daemon sẽ tự quét tìm **Dockerfile**.

## Thao tác với Docker container:
vào docker:
```
docker run -it --name nf_pgta thanhntt2003hcm/nf-pgta:latest bash
```
- Liệt kê các container đang chạy và đã dừng:
  ```
  docker ps -a
  ```
- Liệt kê các container đang chạy:
  ```
  docker ps
  ```
- Liệt kê mỗi cột "CONTAINER ID" của các container đang chạy và đã dừng:
  ```
  docker ps -aq
  ```
- Để "chui" vào 1 container và có thể dùng được terminal để thực hiện các lệnh trong môi trường container đó, nếu container đó đang chạy:
  ```
  docker exec -it <container_name_or_id> bash
  ```
  nếu muốn "chui" vào 1 container đã dừng, khởi động nó lại theo lệnh sau và chạy lại ```docker exec``` như trên:
  ```
  docker start -ai <container_name_or_id>
  ```
- Xoá 1 container đã dừng:
  ```
  docker rm <container_name_or_id>
  ```
- Xoá 1 container đang chạy:
  
  Dừng trước:
  ```
  docker stop <container_name_or_id>
  ```
  Rồi:
  ```
  docker rm <container_name_or_id>
  ```
  Hoặc có thể xoá 1 container đang chạy với 1 lệnh:
  ```
  docker rm -f <container_name_or_id>
  ```
- Xoá tất cả container đã dừng:
  ```
  docker container prune
  ```
- Xoá tất cả container đang chạy và đã dừng:
  ```
  docker rm -f $(docker ps -aq)
  ```
  
# Docker Hub

Để đưa 1 Docker image (đã tạo trong local) lên Docker Hub, cần đăng nhập tài khoản trước (nếu bạn đã tạo rồi). 
- Chưa bật 2FA → bạn có 2 lựa chọn: dùng password hoặc token để login.
- Đã bật 2FA → bắt buộc phải dùng token, vì password thường sẽ bị từ chối.
  
**Cách đăng nhập bằng Docker CLI:**
- Đăng nhập dùng tokens:
  B1. Chọn "Generate new tokens"
  <img width="1482" height="784" alt="image" src="https://github.com/user-attachments/assets/9553739d-0601-48be-8636-97036c524211" />

