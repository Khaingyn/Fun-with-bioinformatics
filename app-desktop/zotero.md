
```
# 1. Di chuyển vào thư mục Zotero trong ổ /data
cd /data/Zotero-9.0.6_linux-x86_64/Zotero_linux-x86_64/

# 2. Chạy script cập nhật biểu tượng mặc định
./set_launcher_icon

# 3. Sao chép file desktop vào thư mục ứng dụng cá nhân
cp zotero.desktop ~/.local/share/applications/

# 4. Sửa đường dẫn thực thi (Exec) và biểu tượng (Icon) trỏ chính xác về ổ /data
sed -i 's|Exec=.*|Exec=/data/Zotero-9.0.6_linux-x86_64/Zotero_linux-x86_64/zotero %u|g' ~/.local/share/applications/zotero.desktop
sed -i 's|Icon=.*|Icon=/data/Zotero-9.0.6_linux-x86_64/Zotero_linux-x86_64/icons/icon128.png|g' ~/.local/share/applications/zotero.desktop

# 5. Cấp quyền và cập nhật cơ sở dữ liệu ứng dụng của Ubuntu
chmod +x ~/.local/share/applications/zotero.desktop
update-desktop-database ~/.local/share/applications/
```

Lưu ý nâng cao cho màn hình 3K / Wayland (tránh bị mờ):  
Zotero dùng nhân Firefox (Gecko). Nếu bạn bật Zotero lên mà thấy chữ hay icon hơi bị mờ  
(do Scale 150% trên màn 3K), bạn ép Zotero chạy chế độ Wayland thuần bằng lệnh này:

```
sed -i 's|Exec=.*|Exec=env MOZ_ENABLE_WAYLAND=1 /data/Zotero-9.0.6_linux-x86_64/Zotero_linux-x86_64/zotero %u|g' ~/.local/share/applications/zotero.desktop
```

Nếu muốn gõ trực tiếp chữ zotero trong terminal bất kỳ để mở ứng dụng:

```
mkdir -p ~/.local/bin
ln -s /data/Zotero-9.0.6_linux-x86_64/Zotero_linux-x86_64/zotero ~/.local/bin/zotero
```
Chạy xong các bước trên, bạn nhấn phím Super (phím Windows) gõ Zotero là app xuất hiện đẹp đẽ trên menu ứng dụng!
