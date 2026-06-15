#!/bin/bash

# 1. Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "❌ Error: You must run this script as root or use 'sudo'."
  exit 1
fi

# 2. Input username and create the account
read -p "👤 Enter the new username to create: " USERNAME

if id "$USERNAME" &>/dev/null; then
  echo "⚠️ User '$USERNAME' already exists on the system!"
else
  echo "⏳ Creating user '$USERNAME'..."
  adduser "$USERNAME"
  if [ $? -ne 0 ]; then
    echo "❌ Failed to create user. Please check and try again."
    exit 1
  fi
  echo "✅ User '$USERNAME' created successfully."
fi

# 3. Initialize SSH configuration directory
USER_HOME="/home/$USERNAME"
SSH_DIR="$USER_HOME/.ssh"
AUTH_KEYS="$SSH_DIR/authorized_keys"

echo "📂 Configuring SSH directory..."
mkdir -p "$SSH_DIR"
touch "$AUTH_KEYS"

# 4. Input and normalize Public Key from Windows/Linux
echo "--------------------------------------------------------"
echo "🔑 Please copy and PASTE the user's Public Key here."
echo "   (The string usually starts with 'ssh-rsa' or 'ssh-ed25519')"
echo "   After pasting, press Enter, then press Ctrl + D to save."
echo "--------------------------------------------------------"

# Read terminal input into a temporary file
cat > /tmp/temp_pub_key

# 💡 Strip out Windows CRLF (^M) line endings if present
sed -i 's/\r//' /tmp/temp_pub_key

# Write to the official configuration file
cat /tmp/temp_pub_key >> "$AUTH_KEYS"
rm -f /tmp/temp_pub_key

# 5. Enforce standard SSH security permissions (Prevents Key rejection)
echo "🛠 Securing SSH directory permissions..."
chown -R "$USERNAME:$USERNAME" "$SSH_DIR"
chmod 700 "$SSH_DIR"
chmod 600 "$AUTH_KEYS"

echo "--------------------------------------------------------"
echo "🎉 Setup completed for standard user: $USERNAME"
echo "📂 SSH Directory: $SSH_DIR (Permissions: 700 - drwx------)"
echo "📄 Authorized Keys File (Permissions: 600 - -rw-------)"
echo "🚀 The user can now connect directly via VS Code or Windows Terminal!"
echo "--------------------------------------------------------"
