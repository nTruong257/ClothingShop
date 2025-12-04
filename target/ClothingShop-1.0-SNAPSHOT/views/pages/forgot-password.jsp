<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleEra - Quên mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${root}/css/header-footer.css">
    <link rel="stylesheet" href="${root}/css/auth.css">
</head>

<body>
<!-- ===== HEADER ===== -->
<jsp:include page="/views/layout/header.jsp" />

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <div class="auth-container">
        <div class="auth-wrapper">
            <!-- ===== FORGOT PASSWORD PAGE ===== -->
            <div id="forgotPage" class="page-content">
                <div class="auth-card">
                    <div class="auth-header">
                        <h1>Quên Mật Khẩu</h1>
                        <p>Nhập email để khôi phục mật khẩu</p>
                    </div>

                    <div class="auth-body">
                        <form id="forgotForm" onsubmit="handleForgotPassword(event)">
                            <div class="form-group">
                                <label class="form-label">Email đăng ký <span class="required">*</span></label>
                                <div class="form-control-wrapper">
                                    <i class="fas fa-envelope form-control-icon"></i>
                                    <input type="email" class="auth-input" id="forgotEmail"
                                           placeholder="example@email.com" required>
                                </div>
                                <div class="error-message" id="forgotEmailError">Vui lòng nhập email hợp lệ</div>
                            </div>

                            <div style="background: #e3f2fd; padding: 15px; border-radius: 8px; margin-bottom: 20px; border-left: 4px solid #2196f3;">
                                <i class="fas fa-info-circle" style="color: #2196f3;"></i>
                                <span style="font-size: 13px; color: #1976d2; margin-left: 8px;">
                                    Chúng tôi sẽ gửi link đặt lại mật khẩu đến email của bạn
                                </span>
                            </div>

                            <button type="submit" class="auth-btn">Gửi</button>

                            <div style="text-align: center; margin-top: 20px;">
                                <a href="login.jsp" class="forgot-link" onclick="showPage('login'); return false;">
                                    <i class="fas fa-arrow-left"></i> Quay lại đăng nhập
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- ===== FOOTER ===== -->
<jsp:include page="/views/layout/footer.jsp" />

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom JavaScript -->
<script src="../../js/main.js"></script>
</body>
</html>