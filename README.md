# Hệ thống Quản lý Giảng viên

Hệ thống cho phép tìm kiếm giảng viên theo tên bộ môn gần đúng.

## Yêu cầu hệ thống

- Python 3.7+
- MySQL Server
- Web Browser hiện đại

## Cài đặt

1. Tạo cơ sở dữ liệu:
   - Đăng nhập vào MySQL:
     ```bash
     mysql -u root -p
     ```
   - Copy nội dung file `database.sql` và chạy trong MySQL để tạo database và dữ liệu mẫu

2. Cài đặt thư viện Python:
   ```bash
   pip install -r requirements.txt
   ```

3. Cấu hình kết nối MySQL:
   - Mở file `app.py`
   - Cập nhật thông tin kết nối MySQL trong biến `db_config`:
     ```python
     db_config = {
         'host': 'localhost',
         'user': 'root',
         'password': 'your_password',  # Thay đổi mật khẩu MySQL của bạn
         'database': 'DuLieu'
     }
     ```

4. Chạy API server:
   ```bash
   python app.py
   ```
   Server sẽ chạy tại địa chỉ: http://127.0.0.1:8000

5. Mở giao diện web:
   - Mở file `index.html` trong trình duyệt web
   - Hoặc sử dụng Live Server trong VS Code để chạy file index.html

## Sử dụng

1. Nhập tên bộ môn cần tìm vào ô tìm kiếm
2. Nhấn nút "Tìm kiếm" hoặc phím Enter
3. Kết quả sẽ hiển thị trong bảng bên dưới

## Cấu trúc project

- `database.sql`: Script tạo database và dữ liệu mẫu
- `requirements.txt`: Danh sách thư viện Python cần thiết
- `app.py`: API server sử dụng FastAPI
- `index.html`: Giao diện web

## Lưu ý

- Đảm bảo MySQL Server đang chạy và có thể kết nối được
- Kiểm tra thông tin kết nối MySQL (username, password) trong file `app.py`
- API server phải được chạy trước khi sử dụng giao diện web