import multiprocessing
import hashlib
import os
import time

def burn_cpu():
    while True:
        hashlib.sha256(os.urandom(1024)).hexdigest()

def burn_ram(size_gb):
    print(f"--- Đang ép RAM công ty 'đổ mồ hôi' với {size_gb}GB... ---")
    try:
        # Ghi dữ liệu thực để RAM thực sự ăn điện
        data = bytearray(size_gb * 1024 * 1024 * 1024)
        for i in range(0, len(data), 1024*1024): # Ghi mỗi 1MB một lần cho nhanh
            data[i] = 1
        print(f"--- Đã chiếm xong {size_gb}GB RAM. Đang giữ tải... ---")
        while True:
            time.sleep(1)
    except MemoryError:
        print("Lỗi: 32GB RAM không đủ gánh mức này!")

if __name__ == "__main__":
    print("🚀 TEST NAS CÔNG TY: 32 LUỒNG + 20GB RAM")
    
    # Chạy 32 luồng CPU (đúng bằng số luồng của 2683v4)
    for _ in range(32):
        multiprocessing.Process(target=burn_cpu, daemon=True).start()
    
    # Chỉ nên chiếm 20GB-24GB RAM để chừa chỗ cho TrueNAS chạy
    multiprocessing.Process(target=burn_ram, args=(22,), daemon=True).start()
    
    print("🔥 Đang theo dõi tải... Nhấn Ctrl + C để dừng.")
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n--- Dừng test ---")
