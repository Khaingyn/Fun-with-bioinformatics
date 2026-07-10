# Google Antigravity
## antigravity agent
- 1
```
nano ~/.local/share/applications/antigravity.desktop
```
- 2
```
[Desktop Entry]
Name=Antigravity Agent
Exec=/home/jojo/Antigravity/Antigravity-x64/antigravity --no-sandbox --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations
Icon=/home/jojo/Antigravity/Antigravity-x64/icon.png
Type=Application
Terminal=false
Categories=Network;
StartupWMClass=antigravity
MimeType=x-scheme-handler/antigravity;text/html;
```

## antigravity IDE

- 1
```
sudo chown root:root /home/khai/AntigravityIDE/chrome-sandbox
sudo chmod 4755 /home/khai/AntigravityIDE/chrome-sandbox
```

- 2
```
sudo cp /home/jojo/AntigravityIDE/resources/app/resources/linux/code.png /usr/share/pixmaps/antigravity-ide.png
```

- 3
```
 nano ~/.local/share/applications/antigravity-ide.desktop
```

-4
```
[Desktop Entry]
Name=Antigravity IDE
Exec=/home/jojo/AntigravityIDE/antigravity-ide --no-sandbox --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations
Icon=antigravity-ide
Type=Application
Terminal=false
Categories=Development;IDE;
StartupWMClass=antigravity-ide
```

```
chmod +x ~/.local/share/applications/antigravity-ide.desktop
```


## Both
```
update-desktop-database ~/.local/share/applications/
```

## Update version mới đè lên 
https://antigravity.google/releases
1. Tải tar.gz của version mới (lưu ở đâu cũng được, sửa tên file ko còn dấu cách)
2. cd vào folder của version hiện tại
3. Chạy giải nén version mới tải về đè vào version cũ
   ```
   tar -vxf /path/to/Antigravity_newversion.tar.gz --strip-components=1
   ```


