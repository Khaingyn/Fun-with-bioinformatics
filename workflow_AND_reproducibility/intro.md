# WORKFLOW MANAGEMENT
Quản lý quý trình phân tích tin sinh học
- **nextflow**:

- **WDL**: https://docs.openwdl.org/overview.html
- **cromwell**: https://github.com/broadinstitute/cromwell?tab=readme-ov-file
  
https://gatk.broadinstitute.org/hc/en-us/articles/360035889771-Pipelining-GATK-with-WDL-and-Cromwell
## More reference
- 

# REPRODUCIBILITY
Khả năng tái tạo lại phân tích cho ra kết quả tương tự ở bất cứ hệ thống tính toán nào
- **Quarto**: https://quarto.org/docs/websites/index.html#workflow
  - Chứa ngôn ngữ R, có thể chứa các ngôn ngữ khác, được phát triển để thay thế Rmarkdown - đuôi file .rmd ()
  - File đuôi  .qmd, có cấu trúc markdown + code block (ô chứa code, trong .qmd gọi là code chunk) giống file .ipynb (chủ yếu) cho python
  - Thường được dùng để tạo report html cho kết quả phân tích. Có thể cùng lúc dùng vẽ plot, tính xstk và xuất hình ảnh cho bài báo, sldie (Vì .qmd chứa code R).
  - Có thể tạo cả website html để host bằng github (ví dụ tạo website html cho Docs, tutorial, và đăng lên github - link web có địa chỉ từ github)
- Bổ trợ cho html report của quarto: **Multiqc**: https://docs.seqera.io/multiqc/custom_content
  - Tool tổng hợp các html (ví dụ các html fastQC) thành 1 html. Docs cho cấu hình lại file html đầu ra, cho phù hợp tích hợp vào report html từ Quarto
- **Jupyter notebook**: https://jupyter.org/
  - Công cụ web, cài về máy local.
  - Sử dụng file đuôi .ipynb (interact python notebook), có cấu trúc markdown + code block, phát triển chủ yếu cho python. File này cũng có thể được mở Google Colab (https://colab.google/), là 1 could tính toán của google, dùng tài khoản gmail để sử dụng.
- **Marimo**: https://marimo.io/
  - Cài về máy local
  - Một tool mới, giống jupyter nootbook nhưng có thêm tương tác plot?
  - Ref: https://realpython.com/courses/getting-started-with-marimo-notebooks/?fbclid=IwY2xjawLjS6NleHRuA2FlbQIxMQABHn-uZ9XoCnv4e5k2CcK7JgoSit9IWQE3rcikptRPlhsKQ5lkJTTfstZjNqlk_aem_C-5odnobYrPqL-lQW-B-Bg
## Công cụ quản lý môi trường cài đặt các tool/package
- Cho bash,python,R:
  - **Conda**: https://docs.conda.io/en/latest/
  - **Mamba/Micromamba**: https://mamba.readthedocs.io/en/latest/
- Cho python:
  - **pipenv**: https://pipenv.pypa.io/en/latest/
## Container
Tạo môi trường cho riêng quy trình phân tích tin sinh, để có thể mang quy trình phân tích này thực hiện ở bất cứ máy tính cá nhân, hay hệ thống máy tính lớn nào mà vẫn cho ra kết quả tương tự nhau.
- **Docker**: https://www.docker.com/
  - Ưu tiên sử dụng trên máy của cá nhân, hạn chế sử dụng trong hệ thống máy tính dùng chung mà người đó chỉ là user không phải admin, vì docker yêu cầu quyền sodu nhiều.
- **SingularityCE** (bởi sylabs):
  - User docs: https://docs.sylabs.io/guides/latest/user-guide/introduction.html
  - admin docs: https://docs.sylabs.io/guides/4.2/admin-guide/
  - Sử dụng được cá trên máy cá nhân và trên hệ thống máy dùng chung - vì ko yêu cầu quyền sudo khi dùng.
  - More ref:
    - https://sylabs.github.io/singularity101/introduction.html
# Quản lý tài nguyên tính toán
- slurm: https://slurm.schedmd.com/documentation.html
  - Tool quản lý được cài trên các máy tính toán hiệu năng cao (HPC - high performance computer)
## More reference
- https://github.com/valdanchev/reproducible-data-science-python, https://valdanchev.github.io/reproducible-data-science-python/intro.html
- https://valdanchev.github.io/reproducible-data-science-python/intro.html
