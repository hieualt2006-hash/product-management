<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Sản Phẩm</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --success: #16a34a;
            --success-hover: #15803d;
            --danger: #dc2626;
            --danger-hover: #b91c1c;
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
            padding: 40px 20px;
            display: flex;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: 1000px;
            background: var(--card-bg);
            border-radius: 16px;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.02);
            overflow: hidden;
            border: 1px solid var(--border);
            padding: 32px;
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--border);
        }

        h2 {
            font-size: 24px;
            font-weight: 700;
            color: var(--text-main);
        }

        .btn {
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 8px;
            display: inline-block;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.15s ease;
        }

        .btn-add {
            background: var(--success);
            color: white;
        }
        .btn-add:hover {
            background: var(--success-hover);
        }

        .btn-edit {
            background: var(--primary);
            color: white;
            margin-right: 6px;
        }
        .btn-edit:hover {
            background: var(--primary-hover);
        }

        .btn-delete {
            background: var(--danger);
            color: white;
        }
        .btn-delete:hover {
            background: var(--danger-hover);
        }

        .table-responsive {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        th {
            background-color: #f1f5f9;
            padding: 14px 18px;
            font-size: 13px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--text-muted);
            border-bottom: 2px solid var(--border);
        }

        td {
            padding: 16px 18px;
            font-size: 14px;
            border-bottom: 1px solid var(--border);
            vertical-align: middle;
        }

        tbody tr:hover {
            background-color: #f8fafc;
        }

        .price-tag {
            font-weight: 600;
            color: #059669;
        }

        .quantity-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 9999px;
            background: #e2e8f0;
            font-weight: 600;
            font-size: 13px;
        }

        .empty-row {
            text-align: center;
            color: var(--text-muted);
            padding: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-section">
            <h2>Quản Lý Sản Phẩm</h2>
            <a href="products?action=new" class="btn btn-add">+ Thêm Sản Phẩm Mới</a>
        </div>

        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th style="width: 70px;">ID</th>
                        <th>Tên Sản Phẩm</th>
                        <th>Giá (VNĐ)</th>
                        <th style="width: 110px;">Số Lượng</th>
                        <th style="width: 160px;">Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${productList}">
                        <tr>
                            <td>${p.id}</td>
                            <td><strong>${p.name}</strong></td>
                            <td class="price-tag">${p.price}</td>
                            <td><span class="quantity-badge">${p.quantity}</span></td>
                            <td>
                                <a href="products?action=edit&id=${p.id}" class="btn btn-edit">Sửa</a>
                                <a href="products?action=delete&id=${p.id}" 
                                   class="btn btn-delete" 
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty productList}">
                        <tr>
                            <td colspan="5" class="empty-row">Chưa có sản phẩm nào trong cơ sở dữ liệu.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
