# error
## 1 Chrome không hiện cửa sổ nhỏ
- Khi bấm tải file về, nếu không tích "Ask where to save each file before downloading" thì nó sẽ tự download về folder đã set,
còn tích vào sẽ không hiện cửa sổ nhỏ để chọn nơi lưu.

### Giải quyết
vào link:
```
chrome://flags/#use-xdg-desktop-portal
```

Chọn `Disable` cho **Wayland session management**
