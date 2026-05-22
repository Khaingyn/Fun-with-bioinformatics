# antigravity agent
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

# antigravity IDE

- 1
```
 nano ~/.local/share/applications/antigravity-ide.desktop
```

- 2
```
sudo cp /home/jojo/AntigravityIDE/resources/app/resources/linux/code.png /usr/share/pixmaps/antigravity-ide.png
```
- 3
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
# Both
```
update-desktop-database ~/.local/share/applications/
```


