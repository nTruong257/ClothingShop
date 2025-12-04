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
                        <form id="loginForm" onsubmit="handleLogin(event)">
                            <div class="form-group">
                                <label class="form-label">Email <span class="required">*</span></label>
                                <div class="form-control-wrapper">
                                    <i class="fas fa-envelope form-control-icon"></i>
                                    <input type="email" class="auth-input" id="loginEmail"
                                           placeholder="example@email.com" required>
                                </div>
                                <div class="error-message" id="loginEmailError">Vui lòng nhập email hợp lệ</div>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Mật khẩu <span class="required">*</span></label>
                                <div class="form-control-wrapper">
                                    <i class="fas fa-lock form-control-icon"></i>
                                    <input type="password" class="auth-input" id="loginPassword"
                                           placeholder="Nhập mật khẩu" required>
                                    <button type="button" class="password-toggle"
                                            onclick="togglePassword('loginPassword')">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                                <div class="error-message" id="loginPasswordError">Mật khẩu phải có ít nhất 6 ký tự
                                </div>
                            </div>

                            <div class="form-options">
                                <div class="remember-me">
                                    <input type="checkbox" id="rememberMe">
                                    <label for="rememberMe">Ghi nhớ đăng nhập</label>
                                </div>
                                <a href="forgot-password.jsp" class="forgot-link" onclick="showPage('forgot'); return false;">Quên mật khẩu?</a>
                            </div>

                            <button type="submit" class="auth-btn">Đăng Nhập</button>

                            <div class="divider">
                                <span>Hoặc đăng nhập với</span>
                            </div>

                            <div class="social-login">
                                <button type="button" class="social-btn facebook">
                                    <i class="fab fa-facebook-f"></i> Facebook
                                </button>
                                <button type="button" class="social-btn google">
                                    <i class="fab fa-google"></i> Google
                                </button>
                            </div>
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