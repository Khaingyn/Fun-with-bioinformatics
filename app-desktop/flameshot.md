# Lỗi: `flameshot gui` báo "Unable to capture screen"

## Triệu chứng
```
$ flameshot gui
flameshot: error: Unable to capture screen
flameshot: info: Screenshot aborted.
```
Xảy ra trên **Ubuntu GNOME + Wayland**, dù đã restart `xdg-desktop-portal` / `xdg-desktop-portal-gnome`.

## Nguyên nhân
Kiểm tra log:
```bash
journalctl --user -u xdg-desktop-portal-gnome -n 5 --no-pager
```
Thấy:
```
GDK backend forced via env var, portal dialogs will not work properly.
Non-compatible display server, exposing settings only.
```
và log của portal chính:
```
A backend call failed: No such interface "org.freedesktop.impl.portal.Screenshot"
```

**Lý do:** Biến môi trường `GDK_BACKEND=wayland,x11` được set **tường minh** trong `/etc/environment`. Khi biến này bị ép cứng (dù giá trị nhìn hợp lý), GTK coi là bị "force" thay vì tự detect, khiến `xdg-desktop-portal-gnome` nhận nhầm display server là "không tương thích" → không expose interface `Screenshot` → flameshot không chụp được.

## Cách sửa

**1. Kiểm tra biến đang bị set ở đâu:**
```bash
grep -rn "GDK_BACKEND" /etc/environment
```

**2. Comment dòng đó trong `/etc/environment`:**
```bash
sudo cp /etc/environment /etc/environment.bak
sudo sed -i 's/^GDK_BACKEND=/#GDK_BACKEND=/' /etc/environment
```

**3. Logout hoàn toàn rồi login lại** (không chỉ restart service — `/etc/environment` chỉ được PAM nạp lúc login mới).
- Nếu logout bị chặn bởi inhibitor khi `sudo reboot`: dùng menu GNOME → **Log Out** (không cần reboot cả máy).

**4. Xác nhận đã hết:**
```bash
env | grep GDK_BACKEND        # kỳ vọng: không có output
journalctl --user -u xdg-desktop-portal-gnome -n 5 --no-pager
# kỳ vọng: không còn dòng "GDK backend forced via env var"
```

**5. Test lại:**
```bash
flameshot gui
```

## Lưu ý thêm (không liên quan lỗi này nhưng hay gặp cùng lúc)
- Tuỳ chọn **"Capture active monitor in X11 and Windows (skip monitor selection)"** trong Flameshot Config **không hoạt động trên Wayland** — đây là giới hạn cố ý của Wayland security model, không phải bug. Nếu bật ô này trên Wayland sẽ báo lỗi *"Capture Active Monitor is not supported on Wayland due to Wayland security model"*.
- Khi có nhiều màn hình, `flameshot gui` trên Wayland sẽ luôn hiện bước chọn màn hình (dialog của portal, không phải của flameshot) — bấm phím `1`/`2` để chọn nhanh, không có cách bypass vì đây là cơ chế bảo mật ở tầng hệ thống.
