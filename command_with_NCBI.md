# Fun with NCBI

Các bộ công cụ dòng lệnh làm việc liên quan tới các cơ sở dữ liệu của NCBI:

1. Entrez Direct (EDirect)
- Home và tài liệu tham khảo: https://www.ncbi.nlm.nih.gov/books/NBK179288/ 
- Tải bằng conda ("entrez-direct"): https://anaconda.org/bioconda/entrez-direct
- Một số lệnh con: esearch (dùng id hoặc từ khóa để tra cứu các cơ sở dữ liệu thuộc NCBI ), efetch (Lấy thông tin từ một kết quả tra cứu),...

2. SRA toolkit
- Home: https://github.com/ncbi/sra-tools
- Tải bằng conda ("sra-tools"): https://anaconda.org/bioconda/sra-tools
- Một số lệnh con: prefetch (tải các file SRA từ 1 id BioProject), fastq-dump hoặc fasterq-dump (Tải các file fastq từ các file SRA),...
- Tài liệu tham khảo:
  - HowTo fasterq dump: https://github.com/ncbi/sra-tools/wiki/HowTo:-fasterq-dump  
  - How to use prefetch and fasterq-dump to extract FASTQ-files from SRA run accessions: https://github.com/ncbi/sra-tools/wiki/08.-prefetch-and-fasterq-dump

# Mục lục
- [Tải các file fastq từ một nghiên cứu sử dụng máy giải trình tự](#Tải-các-file-fastq-từ-một-nghiên-cứu-sử-dụng-máy-giải-trình-tự)


# Tải các file fastq từ một nghiên cứu sử dụng máy giải trình tự
  
&nbsp;&nbsp;&nbsp;&nbsp;Trong các bài báo đăng trên các tạp chí, phần phương pháp khi các tác giả có sử dụng các máy giải trình tự gen của các hãng như Illumina, Oxford Nanopore Technology (ONT), Pacific Bioscience (PacBio),v.v. để giải trình tự của các DNA có trong mẫu (mẫu đất, nước thải hay mẫu phân trong ruột của loài nào đó,.v.), dữ liệu có được từ các máy giải trình tự này sẽ qua một qua quá trình nhỏ để xử lý, kết quả cuối cùng là các file có định dạng fastq (tìm hiểu thêm về fastq: https://en.wikipedia.org/wiki/FASTQ_format#Format , https://zymoresearch.eu/blogs/blog/what-are-phred-scores?srsltid=AfmBOoru6K5kGXly5HhX7nh_fPXzytDm7_e9YAtTQwfF_BW2DmbCyokz), tên các file này có đuôi là ".fastq" hoặc ".fastq.gz" (nếu file fastq được nén bằng gzip).  

&nbsp;&nbsp;&nbsp;&nbsp;Nếu là giải hai chiều (paird-end) thì sẽ có 2 file fastq cho mỗi mẫu, phổ biến là các máy từ Illumina. Nếu là giải một chiều (single-end) thí sẽ có 1 file fastq cho mỗi mẫu, phổ biến là các máy từ ONT, PacBio.  

&nbsp;&nbsp;&nbsp;&nbsp;Sau đó, họ sẽ gửi các file fastq này vào cơ sở sở dữ liệu nào đó, trong nội dung này đề cập tới cơ sở dữ liệu 
Sequence Read Archive (SRA) của NCBI, và các file fastq này sẽ được lưu dưới định dạng SRA (https://www.ncbi.nlm.nih.gov/sra/docs/sra-data-formats/), với tên đuôi .sra - mỗi file fastq đươc lưu thành 1 file sra (nếu giải single-end), còn giải pair-end thì sẽ là 2 file fastq. Và các dữ liệu (file fastq; file sra; các thông tin liên quan tới mẫu - còn gọi là metadata,v.v.) của một nghiên cứu sẽ được NCBI cấp cho một mã định danh (Identifier) ngắn gồm chữ cái và số, để đăng kèm với bài báo (một số bài, tác giả không công khai dữ liệu fastq - không gửi vào cơ sở dữ liệu SRA). Mã định danh của 1 nghiên cứu này, nói ngắn gọn sẽ là id của 1 BioProject (https://www.ncbi.nlm.nih.gov/bioproject/), ví dự như là PRJNA607213 của nghiên cứu https://link.springer.com/article/10.1186/s13213-020-01591-8#Sec2, id này sẽ được làm ví dụ trong bài này.  

&nbsp;&nbsp;&nbsp;&nbsp;Các file fastq được lưu trong cơ sở dữ liệu sra, gồm có 2 dạng sra là: 
- SRA Normalized Format: Các điểm chất lượng - Qscore hay Phred score (xem định dạng fastq là gì để hiểu) của mỗi base (A, T, G, C,.v.v.) trong các file fastq sẽ được giữ nguyên.
- SRA Lite: Toàn bộ các điểm chất lượng trong các file fastq sẽ được đổi thành Q30.

Ở đây hướng dẫn tải file sra với định dạng SRA Normalized Format

## 1. Tải file sra
### 1.1. Tải tất cả file sra từ 1 id BioProject
- Cài đặt entrez-direct trong 1 môi trường conda (cách cài conda: https://docs.anaconda.com/miniconda/) có tên downdata (có thể đổi tên khác bằng cách thay "downdata" trong dòng lệnh bằng tên đó), cài version mới nhất 22.4 (thời điểm viết bài):
```php
conda create -n downdata -c bioconda entrez-direct=22.4
```
- Vào môi trường conda tên downdata vừa tạo:
```php
conda activate downdata
```
- Cài đặt sra-tools (version mới nhất thời điểm viết bài, là 3.1.1) trong môi trường downdata vừa vào:
```php
conda install -c bioconda sra-tools=3.1.1
```
- Sử dụng kết hợp esearch và efetch từ entrez-direct, prefetch từ sra-tools để tải toàn bộ file sra từ id PRJNA607213, lưu tất cả file sra trong một thư mục có tên "sra-file":
  - Nếu muốn tải từ id khác, chỉ cần thay thế id trong dòng lệnh - trong cặp dấu ngoặc kép.
  - Nếu muốn lưu tất cả file sra vào 1 thư mục có tên khác, thay thế tên đó vào những chỗ có "sra-file" trong dòng lệnh, có 4 chỗ.
```php
!esearch -db sra -query "PRJNA607213" | efetch -format runinfo | awk -F ',' 'NR>1 {print $1}' | xargs -I {} sh -c 'prefetch {} -O sra-file/ && mv sra-file/{}/*.sra sra-file/ && rm -rf sra-file/{}'
```
    
