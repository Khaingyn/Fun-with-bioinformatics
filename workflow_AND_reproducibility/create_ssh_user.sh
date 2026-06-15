#!/bin/bash

# 1. Kiểm tra quyền root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Lỗi: Bạn phải chạy script này bằng quyền root hoặc sử dụng 'sudo'."
  exit 1
fi

# 2. Nhập tên user và tạo tài khoản
read -p "👤 Nhập tên user mới cần tạo: " USERNAME

if id "$USERNAME" &>/dev/null; then
  echo "⚠️ User '$USERNAME' đã tồn tại trên hệ thống!"
else
  echo "⏳ Đang tạo user '$USERNAME'..."
  adduser "$USERNAME"
  if [ $? -ne 0 ]; then
    echo "❌ Không thể tạo user. Vui lòng kiểm tra lại."
    exit 1
  fi
  echo "✅ Đã tạo user '$USERNAME' thành công."
fi

# 3. Khởi tạo thư mục cấu hình SSH
USER_HOME="/home/$USERNAME"
SSH_DIR="$USER_HOME/.ssh"
AUTH_KEYS="$SSH_DIR/authorized_keys"

echo "📂 Đang cấu hình thư mục SSH..."
mkdir -p "$SSH_DIR"
touch "$AUTH_KEYS"

# 4. Nhập và chuẩn hóa Public Key từ Windows/Linux
echo "--------------------------------------------------------"
echo "🔑 Vui lòng copy và DÁN (Paste) chuỗi Public Key của user vào đây."
echo "   (Chuỗi thường bắt đầu bằng ssh-rsa hoặc ssh-ed25519)"
echo "   Sau khi dán xong, nhấn Enter rồi bấm tổ hợp phím Ctrl + D để lưu."
echo "--------------------------------------------------------"

# Đọc dữ liệu từ terminal vào file tạm
cat > /tmp/temp_pub_key

# 💡 Khử sạch ký tự CRLF (^M) của Windows nếu có
sed -i 's/\r//' /tmp/temp_pub_key

# Ghi vào file cấu hình chính thức
cat /tmp/temp_pub_key >> "$AUTH_KEYS"
rm -f /tmp/temp_pub_key

# 5. Phân quyền chuẩn bảo mật SSH (Chống lỗi giải mã Key)
echo "🛠 Đang phân quyền bảo mật cho thư mục SSH..."
chown -R "$USERNAME:$USERNAME" "$SSH_DIR"
chmod 700 "$SSH_DIR"
chmod 600 "$AUTH_KEYS"

echo "--------------------------------------------------------"
echo "🎉 Hoàn thành thiết lập cho user thường: $USERNAME"
echo "📂 Thư mục SSH: $SSH_DIR (Quyền: 700 - drwx------)"
echo "📄 File Authorized Keys (Quyền: 600 - -rw-------)"
echo "🚀 Giờ user có thể dùng VS Code hoặc Terminal Windows vào thẳng!"
echo "--------------------------------------------------------"
