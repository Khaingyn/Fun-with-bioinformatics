# Docker

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
  
