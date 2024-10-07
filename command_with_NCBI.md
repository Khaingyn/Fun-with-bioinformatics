# Tải dữ liệu từ NCBI
Các bộ công cụ dòng lệnh làm việc liên quan tới các cơ sở dữ liệu của NCBI:
1. SRA toolkit
- Home: https://github.com/ncbi/sra-tools
- Tải bằng conda ("sra-tools"): https://anaconda.org/bioconda/sra-tools
- Một số lệnh con: prefetch (tải các file SRA từ 1 id BioProject), fastq-dump hoặc fasterq-dump (Tải các file fastq từ các file SRA),...
- Tài liệu tham khảo:

HowTo fasterq dump: https://github.com/ncbi/sra-tools/wiki/HowTo:-fasterq-dump  

How to use prefetch and fasterq-dump to extract FASTQ-files from SRA run accessions: https://github.com/ncbi/sra-tools/wiki/08.-prefetch-and-fasterq-dump

2. Entrez Direct (EDirect)
- Home và tài liệu tham khảo: https://www.ncbi.nlm.nih.gov/books/NBK179288/ 
- Tải bằng conda ("entrez-direct"): https://anaconda.org/bioconda/entrez-direct
- Một số lệnh con: esearch (dùng id hoặc từ khóa để tra cứu các cơ sở dữ liệu thuộc NCBI ), efetch (Lấy thông tin từ một kết quả tra cứu),...
### Tài liệu tham khảo

# Tải các file fastq từ một nghiên cứu sử dụng máy giải trình tự
## 1. Định dạng SRA
https://www.ncbi.nlm.nih.gov/sra/docs/sra-data-formats/
