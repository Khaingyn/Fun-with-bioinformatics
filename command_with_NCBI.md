# Fun with NCBI

Các bộ công cụ dòng lệnh làm việc liên quan tới các cơ sở dữ liệu của NCBI:

1. SRA toolkit
- Home: https://github.com/ncbi/sra-tools
- Tải bằng conda ("sra-tools"): https://anaconda.org/bioconda/sra-tools
- Một số lệnh con: prefetch (tải các file SRA từ 1 id BioProject), fastq-dump hoặc fasterq-dump (Tải các file fastq từ các file SRA),...
- Tài liệu tham khảo:
  - HowTo fasterq dump: https://github.com/ncbi/sra-tools/wiki/HowTo:-fasterq-dump  
  - How to use prefetch and fasterq-dump to extract FASTQ-files from SRA run accessions: https://github.com/ncbi/sra-tools/wiki/08.-prefetch-and-fasterq-dump

2. Entrez Direct (EDirect)
- Home và tài liệu tham khảo: https://www.ncbi.nlm.nih.gov/books/NBK179288/ 
- Tải bằng conda ("entrez-direct"): https://anaconda.org/bioconda/entrez-direct
- Một số lệnh con: esearch (dùng id hoặc từ khóa để tra cứu các cơ sở dữ liệu thuộc NCBI ), efetch (Lấy thông tin từ một kết quả tra cứu),...

# Mục lục
- [Tải các file fastq từ một nghiên cứu sử dụng máy giải trình tự](#Tải-các-file-fastq-từ-một-nghiên-cứu-sử-dụng-máy-giải-trình-tự)


# Tải các file fastq từ một nghiên cứu sử dụng máy giải trình tự
## 1. Định dạng SRA  
&nbsp;&nbsp;&nbsp;&nbsp;Trong các bài báo đăng trên các tạp chí, phần phương pháp khi các tác giả có sử dụng các máy giải trình tự gen của các hãng như Illumina, Oxford Nanopore Technology (ONT), Pacific Bioscience (PacBio),v.v. để giải trình tự của các DNA có trong mẫu (mẫu đất, nước thải hay mẫu phân trong ruột của loài nào đó,.v.), dữ liệu có được từ các máy giải trình tự này sẽ qua một qua quá trình nhỏ để xử lý, kết quả cuối cùng là các file có định dạng fastq (tìm hiểu thêm về fastq: https://en.wikipedia.org/wiki/FASTQ_format#Format , https://zymoresearch.eu/blogs/blog/what-are-phred-scores?srsltid=AfmBOoru6K5kGXly5HhX7nh_fPXzytDm7_e9YAtTQwfF_BW2DmbCyokz), tên các file này có đuôi là ".fastq" hoặc ".fastq.gz" (nếu file fastq được nén bằng gzip).  

&nbsp;&nbsp;&nbsp;&nbsp;Nếu là giải hai chiều (paird-end) thì sẽ có 2 file fastq cho mỗi mẫu, phổ biến là các máy từ Illumina. Nếu là giải một chiều (single-end) thí sẽ có 1 file fastq cho mỗi mẫu, phổ biến là các máy từ ONT, PacBio.  

&nbsp;&nbsp;&nbsp;&nbsp;Sau đó, họ sẽ gửi các file fastq này vào cơ sở sở dữ liệu nào đó, trong nội dung này đề cập tới cơ sở dữ liệu 
Sequence Read Archive (SRA) của NCBI, và các file fastq này sẽ được lưu dưới định dạng SRA (tên đuôi .sra) - mỗi file fastq đươc lưu thành 1 file sra, và các dữ liệu (file fastq; file sra; các thông tin liên quan tới mẫu - còn gọi là metadata,v.v.) của một nghiên cứu sẽ được NCBI cấp cho một mã định danh (Identifier) ngắn gồm chữ cái và số, để đăng kèm với bài báo (một số bài, tác giả không công khai dữ liệu fastq - không gửi vào cơ sở dữ liệu SRA). 

https://www.ncbi.nlm.nih.gov/sra/docs/sra-data-formats/
