- Thêm option --profile để chuyển đổi khối lệnh 1 dòng của awk trên terminal thành 1 file script awk, để sử dụng file này có thể dùng option -f
- File multi FASTA: nếu trình tự read có ít nhất 1 N thì read đó sẽ không được in header lẫn trình tự:
```php
awk 'BEGIN { RS=">"; ORS=">"; FS="\n" } { if(($2!~/N/)==1) print $0 }' file_input

# hoặc là
awk 'BEGIN { RS=">"; ORS=">"; FS="\n" } { if(($2~/N/)==0) print $0 }' file_input

#hoặc là
awk 'BEGIN { RS=">"; ORS=">"; FS="\n" } $2~/N/ { print $0 }' file_input

#hoặc là; getline seq (đọc dòng kế tiếp của header, và gán vào biến "seq)
awk '/^>/ {header=$0; getline seq; if (seq !~ /N/) {print header; print seq;}}' file_input
```

```php

```

```php

```
