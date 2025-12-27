<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleEra - Đăng nhập</title>
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
            <!-- ===== LOGIN PAGE ===== -->
            <div id="loginPage" class="page-content active">
                <div class="auth-card">
                    <div class="auth-header">
                        <h1>Đăng Nhập</h1>
                        <p>Chào mừng bạn quay trở lại!</p>
                    </div>

                    <div class="auth-body">
                        <form id="loginForm" action="${root}/login" method="post">

                            <c:if test="${not empty error}">
                                <div class="alert alert-danger text-center mb-3">
                                        ${error}
                                </div>
                            </c:if>
                            <c:if test="${not empty message}">
                                <div class="alert alert-success text-center mb-3">
                                        ${message}
                                </div>
                            </c:if>

                            <div class="form-group">
                                <label class="form-label">Email <span class="required">*</span></label>
                                <div class="form-control-wrapper">
                                    <i class="fas fa-envelope form-control-icon"></i>
                                    <input type="email" class="auth-input" name="email" id="loginEmail" placeholder="example@email.com" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Mật khẩu <span class="required">*</span></label>
                                <div class="form-control-wrapper">
                                    <i class="fas fa-lock form-control-icon"></i>
                                    <input type="password" class="auth-input" name="password" id="loginPassword" placeholder="Nhập mật khẩu" required>
                                </div>
                            </div>

                            <div class="form-options">
                                <div class="remember-me">
                                    <input type="checkbox" id="rememberMe" name="remember">
                                    <label for="rememberMe">Ghi nhớ đăng nhập</label>
                                </div>
                            </div>

                            <button type="submit" class="auth-btn">Đăng Nhập</button>

                        </form>
                    </div>

                    <div class="auth-footer">
                        Chưa có tài khoản? <a href="register.jsp" onclick="showPage('register'); return false;">Đăng ký ngay</a>
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
<script src="../../js/login.js"></script>
</body>
</html>