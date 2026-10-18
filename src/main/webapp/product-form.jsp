<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product != null ? "Cập Nhật Sản Phẩm" : "Thêm Sản Phẩm Mới"}</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --bg: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: var(--bg);
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .card {
            background: var(--card-bg);
            width: 100%;
            max-width: 480px;
            padding: 32px;
            border-radius: 16px;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.02);
            border: 1px solid var(--border);
        }

        h2 {
            font-size: 22px;
            font-weight: 700;
            color: var(--text-main);
            margin-bottom: 24px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            font-weight: 600;
            color: #334155;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px 14px;
            border: 1.5px solid var(--border);
            border-radius: 8px;
            font-size: 15px;
            font-family: inherit;
            background-color: #fff;
            color: var(--text-main);
            transition: border-color 0.15s ease, box-shadow 0.15s ease;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
        }

        .btn-submit {
            padding: 10px 20px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.15s ease;
        }

        .btn-submit:hover {
            background: var(--primary-hover);
        }

        .btn-cancel {
            margin-left: 12px;
            text-decoration: none;
            color: var(--text-muted);
            font-size: 14px;
            font-weight: 500;
        }

        .btn-cancel:hover {
            color: var(--text-main);
        }

        .actions {
            margin-top: 24px;
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>${product != null ? "Chỉnh Sửa Sản Phẩm" : "Thêm Sản Phẩm Mới"}</h2>
        <form action="products" method="post">
            <input type="hidden" name="id" value="${product.id}" />

            <div class="form-group">
                <label for="name">Tên Sản Phẩm:</label>
                <input type="text" id="name" name="name" value="${product.name}" required />
            </div>
            <div class="form-group">
                <label for="price">Giá (VNĐ):</label>
                <input type="number" step="0.01" id="price" name="price" value="${product.price}" required />
            </div>
            <div class="form-group">
                <label for="quantity">Số Lượng:</label>
                <input type="number" id="quantity" name="quantity" value="${product.quantity}" required />
            </div>

            <div class="actions">
                <button type="submit" class="btn-submit">${product != null ? "Lưu Thay Đổi" : "Thêm Mới"}</button>
                <a href="products" class="btn-cancel">Hủy</a>
            </div>
        </form>
    </div>
</body>
</html>
