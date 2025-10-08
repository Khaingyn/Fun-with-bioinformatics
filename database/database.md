# Các reference database được sử dụng trong tin sinh


## Human genome reference
Hiện tại có 2 phiên bản genome của người (human) được dùng phổ biến là GRCh38 (hay hg38) - mới nhất, và bản GRCh37 (hay hg19).

### UCSC
Website: https://hgdownload.soe.ucsc.edu/downloads.html

- Ngay đầu trang chủ, ở mục "Human genomes", sẽ thấy ngay 2 version hg38: **Dec. 2013 (GRCh38/hg38)** và hg 19: **Feb. 2009 (GRCh37/hg19)**:

  <img width="1254" height="920" alt="image" src="https://github.com/user-attachments/assets/9048712f-cfb5-48ca-9151-0e81a09aaee5" />

- Ở cả 2 version, ngay dòng đầu **Genome sequence files and select annotations (2bit, GTF, GC-content, etc)** là nơi có chứa các trình tự liên quan tới Human genomes (kể cả fasta), riêng ở hg38 thì
người ta chia ra hẳn bên ngoài để ở **Standard genome sequence files and select annotations (2bit, GTF, GC-content, etc)**:

  <img width="728" height="471" alt="image" src="https://github.com/user-attachments/assets/3789ecd5-7dff-44ba-9c15-b4d1fbd7e121" />

  Chọn vào mục đầu tiên đó, kéo xuống cuối cùng, sẽ thấy ngay dòng **hg38.fa.gz**, đây là file fasta của Human genome được nén dưới dạng gzip (đuôi .gz):

  - hg38:
  
    <img width="548" height="259" alt="image" src="https://github.com/user-attachments/assets/e10ce487-e7d0-460a-81c8-ec813a943c95" />

  - hg19:
  
    <img width="542" height="299" alt="image" src="https://github.com/user-attachments/assets/157497de-2d9e-4984-9787-018554b436f5" />

- Tuy nhiên, để dùng Human genome fasta làm "reference genome" trong bước mapping/aligment (sử dụng các công cụ mapping/aligner như bowtie, bwa,..) các đoạn đọc (reads - từ máy giải trình tự NGS), thì NCBI có cung cấp 1 bản fasta riêng chuyên cho việc này, đó là "Analysis set sequence files":

  <img width="731" height="127" alt="image" src="https://github.com/user-attachments/assets/7200239f-4883-41c5-b475-fae1cc9d6c03" />

  *Tìm hiểu thêm "Analysis set":  
  1)https://genome.ucsc.edu/FAQ/FAQdownloads.html#downloadAnalysis  
  2)https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.15_GRCh38/seqs_for_alignment_pipelines.ucsc_ids/README_analysis_sets.txt  
  3)https://ftp.ncbi.nlm.nih.gov/genomes/archive/old_genbank/Eukaryotes/vertebrates_mammals/Homo_sapiens/GRCh37.p13/seqs_for_alignment_pipelines/README_ANALYSIS_SETS*

  - Vào mục đó, kéo xuống dưới cùng, sẽ thấy file fasta cần tải:

    <img width="610" height="160" alt="image" src="https://github.com/user-attachments/assets/b4e4772e-1041-481a-a20c-b6db2bb37ef1" />

  - Với hg19 thì cũng có, hãy chọn dòng đầu tiên **Genome sequence files and select annotations (2bit, GTF, GC-content, etc)**, kéo xuống cuối, vào đường dẫn này:

    <img width="524" height="81" alt="image" src="https://github.com/user-attachments/assets/f043b43e-2bf4-4111-95a4-cdf66f950edd" />

    - Nó sẽ dẫn sang trang khác, file fasta hg19 cần tải:

      <img width="736" height="173" alt="image" src="https://github.com/user-attachments/assets/ad9be759-87bf-45fa-98fc-4f34703ea0b3" />

- Nếu như chỉ muốn lấy trình tự của 1 hoặc 1 vài nhiễm sắc thể, thì có thể vào mục thứ 2 **Sequence data by chromosome**:

  <img width="736" height="161" alt="image" src="https://github.com/user-attachments/assets/d0077b8a-ac2b-4a29-ba27-755185f141e7" />

  - Chẳng hạn mình muốn lấy trình tự của NST 21, tìm dòng này **chr21.fa.gz** và tải về:

    <img width="512" height="150" alt="image" src="https://github.com/user-attachments/assets/024e82e8-1018-4c47-a8b3-ecbd91b5e270" />

  - Với hg19 cũng tương tự vậy, và tìm:

    <img width="456" height="65" alt="image" src="https://github.com/user-attachments/assets/87f6b0af-342f-4f47-beab-281050a151a0" />


  
## Chưa phân loại

Đây là các database mà mình biết được từ các diễn đàn thảo luận, thấy hay, nhưng chưa tìm hiểu nên để tạm ở mục này.

