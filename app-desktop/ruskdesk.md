
```
sudo systemctl start rustdesk
sudo systemctl enable rustdesk
sudo systemctl status rustdesk
```

for restart hpc, ruskdesk still auto start

```
sudo nano /etc/gdm3/custom.conf
```

Remove # from `#WaylandEnable=false`
```
WaylandEnable=false
```

```
sudo systemctl restart gdm3
```
