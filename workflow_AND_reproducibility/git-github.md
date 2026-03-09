# Git

## Bắt đầu với Git

Để bắt đầu sử dụng với git, cần phải có một repository đã được tạo trên Github. Sau đó, thực hiện tải repo này về máy local với lệnh:

```
git clone <http_link_or_SSH_link_of_repo>
```
Trước khi `clone` về máy local, có vài điều cần biết và thiết lập trước:

1. Nếu như repo này là **public** và chủ sở hữu là tài khoản của bạn, 

2. 

**Sau khi đăng nhập xong:**

Tất cả các lệnh sau phải được thực hiện khi bạn đang ở level thư mục cao nhất của thư mục repo github đã clone về (thư mục làm việc: working directory - wd), tức ví dụ bạn `git clone` repo Fun-with-bioinformatics, sẽ có thư mục tên "Fun-with-bioinformatics" trong máy local, thì bạn phải đang ở thư mục "Fun-with-bioinformatics" chứ không phải "Fun-with-bioinformatics/thư_mục_con" nào đó.

1. Thêm tất cả các file có sự thay đổi vào **vùng stage**, chạy lệnh:
    ```
    git add .
    ```
    - hoặc bạn chỉ muốn thêm cụ thể file nào đó, chạy lệnh:
        ```
        git add ./path/to/file
        ```
2. Commit: Đính kèm các tin nhắn cho sự thay đổi sắp được cập nhật vào repo github. Chạy lệnh:

    ```
    git commit -m "Cap nhat cai nay nha ba con"
    ```
    - hoặc bạn có nội dung tin nhắn dài hơn "Cap nhat cai nay nha ba con" thì chạy lệnh:
        ```
        git commit
        ```
        lúc này terminal sẽ mở 1 text editor, chẳng hạn như nano, và sẽ có nội dung như sau:
        ```
        # Please enter the commit message for your changes. Lines starting
        # with '#' will be ignored, and an empty message aborts the commit.
        #
        # Changes to be committed:
        #       new file:   workflow_AND_reproducibility/git-github.md
        ```
        hãy nhập tin nhắn ở hàng đầu tiên, ví dụ:
        ```
        Cap nhat sieu cap nha hehehehe
        # Please enter the commit message for your changes. Lines starting
        # with '#' will be ignored, and an empty message aborts the commit.
        #
        # Changes to be committed:
        #       new file:   workflow_AND_reproducibility/git-github.md
        ```
        sau đó lưu file lại (ctrl+X --> Y --> enter). Terminal ra output:
        ```
        [main 70fc1e1] Cap nhat sieu cap nha hehehehe
        1 file changed, 23 insertions(+), 4 deletions(-)
        ```
        vậy là commit thành công.

3. Đưa các sửa đổi từ repo local lên repo github. Sau khi commit xong, chạy lệnh:

    ```
    git push
    ```
    sau đó bạn lên github website để kiểm tra.





## Khôi phục lại trạng thái của file

Quy trình cập nhật file được sửa từ repo local lên repo github thường là:

```
file_A -->file_A_editted --git_add--> stage --git_commit--> git_push--> update_on_github

```

trạng thái file_A đã được `git push` lên github, bạn sửa **file_A** này trong repo local, thành **file_A_editted**. Đột nhiên vì lý do nào đó, bạn không muốn **file_A_editted** nữa và muốn quay lại **file_A**, nhưng **file_A_editted** đã được lưu và không thể ctrl+Z quay lại lúc chưa sửa. Để quay lại **file_A**, thực hiện:

```
git restore file_A_editted
```

- lúc này, nội dung **file_A_editted** sẽ trở lại như **file_A**. Trước khi `git restore`, bạn có thể  `git status` để check xem là có đúng **file_A_editted** có bị thay đổi so với commit mới nhất không (là **file_A**).

Hoặc trong ngữ cảnh khác, bạn vẫn muốn giữ nguyên **file_A_editted**, sau đó bạn `git add` **file_A_editted** và bạn cũng làm tương tự vậy với vài file khác để chuẩn bị `git commit` rồi `git push` lên github, nhưng vì lý do nào đó, bạn chỉ muốn `git commit` các file kia, chưa muốn `git commit` **file_A_editted**, để  huỷ add **file_A_editted**, thực hiện:

```
git restore --staged file_A_editted
```

- sau đó bạn `git status` để kiểm tra, nếu tên **file_A_editted** có màu đỏ là đã huỷ git add thành công.

## Repo GitHub mới hơn repo local

Khi 1 repo github có từ 2 người đóng góp trở lên (tức chủ repo github đó mời thêm collaborators), các thành viên sẽ liên tục `git push` từ repo local của họ lên repo github để cập nhật sửa đổi cho repo github. 

Khi bạn muốn xem hoặc có thể sửa/cập nhật tiếp tục các file mà thành viên khác đã tạo/sửa đổi, bạn cần  đồng bộ repo local của bạn với repo github để repo local có trạng thái file mới nhất sau đó mới tiến hành sửa trên các file mới này và lại `git add, git commit, git push` các kiểu sau khi sửa. Để thực hiện đồng bộ, dùng lệnh:

```
git pull origin main
```

- Trước khi `git pull`, muốn:

1. Cho xem  "commit" nào có trong repo github (**origin/main**) nhưng bị thiếu trong repo local (**HEAD**), nghĩa là repo github có các commit mới mà repo local chưa có:

    ```
    git log HEAD..origin/main --oneline
    ```
    
    - Ví dụ, tôi thay đổi file git-github.md trên github, sau đó tôi chạy `git log` trong terminal, kết quả in ra:

            ```
            4de8cf4 (origin/main, origin/HEAD) Update git-github.md
            ```

        - `4de8cf4` → commit hash
        - `Update git-github.md` → commit message

2. Xem files nào đã được thay đổi giữa repo local và repo github:

    ```
    git diff HEAD..origin/main --name-only
    ```

    - Ví dụ, kết quả in ra:

        ```
        workflow_AND_reproducibility/git-github.md
        ```
        --> duy nhất file git-github.md có sự thay đổi, và nằm trong commit từ show bằng `git log` 

## Agent forwarding: cho server mượn private key ssh của client để ssh vào repo github
1. Trên máy client
   Chạy trong terminal:
    ```
    # Bật tác vụ ngầm quản lý chìa khóa
    eval "$(ssh-agent -s)"

    # Nạp chìa khóa vào (thường là id_ed25519 hoặc id_rsa)
    ssh-add ~/.ssh/id_ed25519
    ```

    Sau đó sửa file ~/.ssh/config
   ```
   Host Ten_Server_Cua_Ban
    HostName 192.767.1.676  # (IP của server)
    User jojo               # (Tên đăng nhập của bạn)
    ForwardAgent yes        # <-- THÊM DÒNG NÀY VÀO ĐÂY
   ```
    Rồi ssh vào server, bằng terminal hoặc vscopde đều ok, kiểm tra:
    ```
    ssh -T git@github.com
    ```

    Nếu không sửa file config thì cũng được, nhưng khi đó, ssh vào server phải thêm cờ -A

2. (chưa test) Khi máy client mất mạng, mà trên server đang ở trong tmux, sau đó có mạng thì client ssh vào server lại. Thì đường ống mượn key ban đầu đã cũ, giờ là đường ống mới, phải cập nhật lại để có thể thao tác với repo github nếu như vẫn muốn thao tác trong phiên tmux này
   sửa file bashcr trên server:
   ```
   nano ~/.bashrc
   ```

   thêm dòng vào cuối file:
   ```
   alias fixssh='export SSH_AUTH_SOCK=$(ls -t /tmp/ssh-*/agent.* 2>/dev/null | head -n 1)'
   ```
   ctrl+O, enter (lưu lại) -> ctrl+X (thoát). Rồi từ giờ về mà bị mất mạng client, thì cứ gõ `fixssh` trước khi pull/push gì đó.

   
