# Alibaba Cloud OSS Setup and Download Guide

This note documents how to set up **Alibaba Cloud OSS (`ossutil`) v2** on Linux and download sequencing data from an OSS path.

> Tested with `ossutil v2.4.0` on Ubuntu/Linux.
>
> **Do not commit real AccessKey credentials to GitHub.** Use placeholders in documentation and configure credentials interactively.

---

## 1. Remove old `ossutil` v1 (if installed)

Check where the old binaries are located:

```bash
which ossutil
which ossutil64
```

If they point to system binaries such as:

```text
/usr/bin/ossutil
/usr/bin/ossutil64
```

remove them:

```bash
sudo rm /usr/bin/ossutil
sudo rm /usr/bin/ossutil64
hash -r
```

Verify:

```bash
command -v ossutil || echo "ossutil removed"
command -v ossutil64 || echo "ossutil64 removed"
```

---

## 2. Install `ossutil` v2

Example using `ossutil v2.4.0` for Linux x86_64:

```bash
wget https://gosspublic.alicdn.com/ossutil/v2/2.4.0/ossutil-2.4.0-linux-amd64.zip
unzip ossutil-2.4.0-linux-amd64.zip
cd ossutil-2.4.0-linux-amd64
chmod +x ossutil
```

Check the version:

```bash
./ossutil version
```

---

## 3. Make `ossutil` available globally

To run `ossutil` from any directory, move the executable to `/usr/local/bin`:

```bash
sudo mv ossutil /usr/local/bin/ossutil
```

Check:

```bash
which ossutil
ossutil version
```

Expected path:

```text
/usr/local/bin/ossutil
```

---

## 4. Configure Alibaba Cloud OSS credentials

Run:

```bash
ossutil config
```

When prompted for the config file path, press **Enter** to use the default:

```text
/home/<USER>/.ossutilconfig
```

Enter the credentials provided by the data provider:

```text
Access Key ID:
<YOUR_ACCESS_KEY_ID>

Access Key Secret:
<YOUR_ACCESS_KEY_SECRET>
```

For Alibaba Cloud OSS Hong Kong:

```text
Region:
cn-hongkong
```

For `Endpoint`, press **Enter** to use the default public endpoint:

```text
Endpoint:
[Enter]
```

The corresponding public endpoint is:

```text
oss-cn-hongkong.aliyuncs.com
```

### Important

Do **not** confuse the region with the endpoint.

Correct:

```text
Region = cn-hongkong
```

Incorrect:

```text
Region = oss-cn-hongkong
```

---

## 5. Check the configuration

List configured profiles:

```bash
ossutil config list-profiles
```

Check the region:

```bash
ossutil config get region
```

Expected:

```text
cn-hongkong
```

---

## 6. Test access to the OSS data

Example OSS path:

```text
oss://gwasia/2026.10/30-1392354455/
```

List the top-level contents:

```bash
ossutil ls oss://gwasia/2026.10/30-1392354455/
```

Recursively list all objects:

```bash
ossutil ls oss://gwasia/2026.10/30-1392354455/ -r
```

If the files are listed successfully, the following are working:

- AccessKey ID
- AccessKey Secret
- Region
- Network connection
- OSS permissions

---

## 7. Download all sequencing data

Create a local output directory:

```bash
mkdir -p raw
```

Download the complete OSS prefix recursively:

```bash
ossutil cp \
  oss://gwasia/2026.10/30-1392354455/ \
  ./raw/ \
  -r
```

For large sequencing files, enable parallel multipart transfer:

```bash
ossutil cp \
  oss://gwasia/2026.10/30-1392354455/ \
  ./raw/ \
  -r \
  --parallel 4
```

To avoid overwrite confirmation when appropriate:

```bash
ossutil cp \
  oss://gwasia/2026.10/30-1392354455/ \
  ./raw/ \
  -r \
  -f \
  --parallel 4
```

---

## 8. Download directly to a project directory

Example:

```bash
ossutil cp \
  oss://gwasia/2026.10/30-1392354455/ \
  /path/to/project/raw/ \
  -r \
  --parallel 4
```

For example:

```bash
ossutil cp \
  oss://gwasia/2026.10/30-1392354455/ \
  /media/jojo/exos/precigene/metagenomics_service/PROJECT/raw/ \
  -r \
  --parallel 4
```

---

## 9. Useful commands

Check version:

```bash
ossutil version
```

Check executable location:

```bash
which ossutil
```

List profiles:

```bash
ossutil config list-profiles
```

Check configured region:

```bash
ossutil config get region
```

List OSS path:

```bash
ossutil ls oss://BUCKET/PREFIX/
```

List recursively:

```bash
ossutil ls oss://BUCKET/PREFIX/ -r
```

Download recursively:

```bash
ossutil cp oss://BUCKET/PREFIX/ ./local_directory/ -r
```

---

## Security notes

Never put real OSS credentials in:

- Git repositories
- Markdown documentation
- Shell scripts committed to Git
- Screenshots
- Issue trackers
- Shared chat messages

Use placeholders such as:

```text
<YOUR_ACCESS_KEY_ID>
<YOUR_ACCESS_KEY_SECRET>
```

If an AccessKey Secret is accidentally exposed, revoke or rotate the credential from Alibaba Cloud as soon as possible.
