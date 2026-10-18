# Ứng Dụng Quản Lý Sản Phẩm (Product Management)

Ứng dụng web quản lý sản phẩm hoàn chỉnh theo mô hình **MVC** sử dụng **JSP, Servlet, JDBC và cơ sở dữ liệu MySQL**.

## 📋 Tính năng chính
- **Xem danh sách sản phẩm**: Hiển thị bảng dữ liệu sản phẩm từ MySQL qua JSTL (`<c:forEach>`).
- **Thêm sản phẩm mới**: Form nhập liệu validate và lưu vào database.
- **Chỉnh sửa thông tin**: Cập nhật tên, đơn giá, số lượng sản phẩm.
- **Xóa sản phẩm**: Có popup xác nhận (`confirm dialog`) trước khi xóa.

## 🏗️ Kiến trúc thư mục chuẩn
```text
product-management/
├── pom.xml
├── .gitignore
├── database.sql
├── README.md
├── src/main/
│   ├── java/com/example/product/
│   │   ├── model/Product.java
│   │   ├── dao/DBContext.java
│   │   ├── dao/ProductDAO.java
│   │   └── controller/ProductServlet.java
│   └── webapp/
│       ├── WEB-INF/
│       │   └── web.xml
│       ├── product-list.jsp
│       └── product-form.jsp
```

## 🛠️ Công nghệ sử dụng
- **Ngôn ngữ**: Java 17
- **Kiến trúc**: MVC (Model - View - Controller)
- **Web**: Jakarta Servlet 5.0 / 6.0, JSP, JSTL
- **Cơ sở dữ liệu**: MySQL 8.0 (MySQL Connector/J 8.0.33)
- **Công cụ build**: Apache Maven
- **Server**: Apache Tomcat 10.1+

## 💾 Cài đặt cơ sở dữ liệu MySQL
1. Mở MySQL Workbench hoặc terminal MySQL.
2. Thực thi toàn bộ lệnh trong file [`database.sql`](database.sql):
   ```sql
   CREATE DATABASE IF NOT EXISTS exam_db;
   USE exam_db;

   CREATE TABLE IF NOT EXISTS products (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(255) NOT NULL,
       price DOUBLE NOT NULL,
       quantity INT NOT NULL
   );

   INSERT INTO products (name, price, quantity) VALUES
   ('Bàn phím cơ AKKO', 1250000, 15),
   ('Chuột Logitech G102', 399000, 30),
   ('Tai nghe Gaming', 650000, 20);
   ```
3. Cập nhật thông tin tài khoản MySQL (URL, USER, PASS) trong file [`DBContext.java`](src/main/java/com/example/product/dao/DBContext.java) nếu có thay đổi.

## 🚀 Hướng dẫn đóng gói và triển khai
1. Đóng gói WAR bằng Maven:
   ```bash
   mvn clean package
   ```
2. Copy `target/product-management.war` vào thư mục `webapps` của Tomcat.
3. Khởi động Tomcat và truy cập:
   ```text
   http://localhost:8080/product-management/products
   ```
