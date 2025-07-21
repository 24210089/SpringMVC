<%@ page isErrorPage="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Truy cập bị từ chối</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f8f9fa;
            }

            .error-container {
                text-align: center;
            }

            .error-code {
                font-size: 10rem;
                font-weight: bold;
                color: #dc3545;
            }

            .error-message {
                font-size: 1.5rem;
            }
        </style>
    </head>

    <body>
        <div class="error-container">
            <div class="error-code">403</div>
            <div class="error-message">Rất tiếc, bạn không có quyền truy cập trang này.</div>
            <p class="mt-3">Vui lòng quay lại trang chủ hoặc liên hệ với quản trị viên.</p>
            <a href="/" class="btn btn-primary mt-2">Về Trang Chủ</a>
        </div>
    </body>

    </html>