<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleEra - Tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${root}/css/header-footer.css">
    <link rel="stylesheet" href="${root}/css/account.css">
</head>

<body>
<!-- ===== HEADER ===== -->
<jsp:include page="/views/layout/header.jsp" />

<!-- ===== MAIN CONTENT ===== -->
<main>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="sidebar">
                    <h4>TÀI KHOẢN</h4>
                    <a href="${root}/account">Thông tin tài khoản</a>
                    <a href="${root}reset-password">Đổi mật khẩu</a>
                    <a href="${root}order_status">Trạng thái đơn hàng</a>
                    <a href="${root}order-history">Xem lịch sử mua hàng</a>
                    <a href="${root}/logout" id="logoutBtn">Đăng xuất</a>
                </div>
            </div>
            <div class="col-md-9">
                <div class="content">
                    <h4>CẬP NHẬT THÔNG TIN TÀI KHOẢN</h4>
                    <form id="accountInfoForm">
                        <div class="form-group">
                            <label>* Email của bạn:</label>
                            <span id="emailInput"></span>
                        </div>
                        <div class="form-group">
                            <label class="label-firstname">Tên:</label>
                            <input type="text" class="form-control" id="firstNameInput">
                        </div>
                        <div class="form-group">
                            <label class="label-lastname">Họ:</label>
                            <input type="text" class="form-control" id="lastNameInput">
                        </div>
                        <div class="form-group">
                            <label class="label-phone">Điện thoại:</label>
                            <input type="text" class="form-control" id="phoneInput">
                        </div>

                        <!-- Các trường khác không cần thay đổi -->
                        <div class="form-group">
                            <label>Địa chỉ:</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Quốc gia:</label>
                            <select class="form-control">
                                <option>Việt Nam</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="input-shipping-zone" class="form-label">Tỉnh / thành phố</label>
                            <select name="shipping_zone_id" id="input-shipping-zone" class="form-select">
                                <option value="0">Vui lòng chọn tỉnh/thành phố</option>
                                <option value="43">TP.Hồ Chí Minh - Nội thành</option>
                                <option value="44">TP.Hồ Chí Minh - Ngoại thành</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="input-shipping-custom-field-30" class="form-label">Quận / Huyện</label>
                            <select name="shipping_custom_field[address][30]"
                                    id="input-shipping-custom-field-30" class="form-select">
                                <option value="0">Vui lòng chọn quận/huyện</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-save" id="save-btn">
                            <i class="fas fa-save"></i> Lưu
                        </button>
                    </form>
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
<script src="${root}/js/main.js"></script>
<script src="${root}/js/home.js"></script>
</body>
</html>