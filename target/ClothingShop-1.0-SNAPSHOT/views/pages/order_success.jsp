<!doctype html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <title>StyleEra - Thành công</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../../css/header-footer.css">
    <link rel="stylesheet" href="../../css/oder_success.css">
</head>

<body>
<header class="site-header">
    <div class="header-container">
        <div class="header-main-row">
            <!-- Left Section -->
            <div class="header-left-section">
                <button class="mobile-menu-toggle" aria-label="Open menu" onclick="toggleMobileMenu()">
                    <i class="fas fa-bars"></i>
                </button>
            </div>

            <!-- Logo -->
            <div class="brand-logo">
                <a href="index.jsp" aria-label="home">
                    <img src="../../images/logo.png" alt="StyleEra"/>
                </a>
            </div>

            <!-- Navigation Menu -->
            <nav class="main-navigation" id="mainNavigation">
                <div class="mobile-nav-actions">
                    <button class="search-trigger-btn" aria-label="Search">
                        <i class="fas fa-search"></i>
                    </button>
                    <button class="mobile-close-btn" aria-label="Close" onclick="toggleMobileMenu()">
                        <i class="fas fa-times"></i>
                    </button>
                </div>

                <ul class="primary-nav-list">
                    <li class="nav-item">
                        <a class="nav-link-primary" href="index.jsp">TRANG CHỦ</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link-primary" href="product.jsp">NAM</a>
                        <div class="submenu-container">
                            <div class="submenu-column">
                                <a href="product.jsp" class="submenu-title">ÁO NAM</a>
                                <ul class="submenu-items">
                                    <li><a href="product.jsp">Áo Khoác Nam</a></li>
                                    <li><a href="product.jsp">Áo Thun</a></li>
                                    <li><a href="product.jsp">Áo Polo</a></li>
                                    <li><a href="product.jsp">Áo Sơ Mi</a></li>
                                </ul>
                            </div>
                            <div class="submenu-column">
                                <a href="product.jsp" class="submenu-title">QUẦN NAM</a>
                                <ul class="submenu-items">
                                    <li><a href="product.jsp">Quần ngắn</a></li>
                                    <li><a href="product.jsp">Quần dài</a></li>
                                    <li><a href="product.jsp">Quần Jean</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link-primary" href="product.jsp">NỮ</a>
                        <div class="submenu-container">
                            <div class="submenu-column">
                                <a href="product.jsp" class="submenu-title">ÁO NỮ</a>
                                <ul class="submenu-items">
                                    <li><a href="product.jsp">Áo Khoác</a></li>
                                    <li><a href="product.jsp">Áo Thun</a></li>
                                    <li><a href="product.jsp">Áo Polo</a></li>
                                    <li><a href="product.jsp">Áo Sơ Mi</a></li>
                                </ul>
                            </div>
                            <div class="submenu-column">
                                <a href="product.jsp" class="submenu-title">QUẦN / VÁY NỮ</a>
                                <ul class="submenu-items">
                                    <li><a href="product.jsp">Váy</a></li>
                                    <li><a href="product.jsp">Đầm</a></li>
                                    <li><a href="product.jsp">Quần ngắn</a></li>
                                    <li><a href="product.jsp">Quần dài</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link-primary" href="product.jsp">Đồ đôi</a>
                        <div class="submenu-container">
                            <ul class="submenu-items">
                                <li><a href="product.jsp">Áo khoác đôi</a></li>
                                <li><a href="product.jsp">Áo thun đôi</a></li>
                                <li><a href="product.jsp">Đồ bộ đôi</a></li>
                            </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link-primary" href="contact.jsp">LIÊN HỆ</a>
                    </li>
                </ul>
            </nav>

            <!-- Right Section -->
            <div class="header-right-section">
                <div class="search-form-wrapper" id="searchForm">
                    <form action="/search" class="search-input-group">
                        <input type="hidden" name="type" value="product"/>
                        <button class="search-submit-btn" type="submit" aria-label="Search">
                            <i class="fas fa-search"></i>
                        </button>
                        <input name="q" maxlength="40" autocomplete="off" class="search-input-field" type="text"
                               placeholder="Tìm kiếm..." aria-label="Search">
                    </form>
                </div>

                <div class="account-dropdown-wrapper">
                    <a href="login.jsp" class="account-link">
                        <i class="fa fa-user"></i>
                    </a>
                    <ul class="account-dropdown-menu">
                        <li><a href="account.jsp">Tài khoản của tôi</a></li>
                        <li><a href="#">Đăng xuất</a></li>
                    </ul>
                </div>

                <a class="cart-link" href="cart.jsp">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="cart-badge">0</span>
                </a>

            </div>
        </div>
    </div>
</header>
<div class="page-wrap">
    <main class="success-card" role="main">
        <div class="success-header">
            <div class="tick-wrap" aria-hidden="true">
          <span class="tick">
            <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
              <path d="M4 12l4 4L20 6"></path>
            </svg>
          </span>
            </div>
            <div>
                <h1 class="success-title">Bạn đã đặt hàng thành công!</h1>
                <p class="success-sub">Cảm ơn bạn đã mua sắm tại <strong>StyleEra</strong>. Đơn hàng của bạn đang được
                    xử lý.
                </p>
            </div>
        </div>

        <div class="order-meta">
            <div>
                <div class="order-id" id="orderId">Mã đơn hàng: #985723</div>
                <div class="note">Ngày đặt: <span id="orderDate">14/11/2025</span></div>
            </div>
            <div class="order-actions">
                <button class="btn" id="viewOrderBtn">
                    <a href="order_status.jsp">Xem đơn hàng</a>
                </button>

            </div>
        </div>

        <section class="section">
            <h4>Thông tin giao hàng</h4>
            <div class="info-grid">
                <div class="info-box">
                    <div class="info-label">Tên</div>
                    <div class="info-val" id="shipName">Lê Tấn Thành</div>
                </div>
                <div class="info-box">
                    <div class="info-label">Số điện thoại</div>
                    <div class="info-val" id="shipPhone">0339378036</div>
                </div>
                <div class="info-box" style="grid-column:1 / -1;">
                    <div class="info-label">Địa chỉ</div>
                    <div class="info-val" id="shipAddress">ktx khu B, Đông Hòa, Dĩ An, Bình Dương</div>
                </div>
                <div class="info-box">
                    <div class="info-label">Thời gian dự kiến giao</div>
                    <div class="info-val" id="shipETA">Từ 8:00 - 12:00, 16/11/2025</div>
                </div>
                <div class="info-box">
                    <div class="info-label">Phương thức thanh toán</div>
                    <div class="info-val" id="payMethod">Thanh toán khi giao hàng</div>
                </div>
            </div>
        </section>

        <section class="section">
            <h4>Ghi chú</h4>
            <div class="info-box" style="min-height:64px"></div>
        </section>

    </main>

    <aside class="summary-card" aria-labelledby="summaryTitle">
        <div class="summary-title" id="summaryTitle">Chi tiết đơn hàng</div>

        <div class="product-row">
            <img src="../../images/image_product/quanjeans_checkout.png" alt="Quần jeans nam đen basic">
            <div style="flex:1">
                <div class="prod-name">Quần jeans nam đen basic</div>
                <div class="prod-meta">Size M • Màu: Đen</div>
            </div>
            <div style="text-align:right">
                <div style="font-weight:600">470.000đ</div>
                <div class="prod-meta">SL: 1</div>
            </div>
        </div>
        <hr>
        <div class="price-row">
            <div>Tạm tính</div>
            <div>470.000đ</div>
        </div>
        <div class="price-row">
            <div>Phí vận chuyển</div>
            <div>30.000đ</div>
        </div>
        <hr>
        <div class="total">
            <div style="font-weight:800;font-size: 20px; color: #ff6f61;">Tổng cộng</div>
            <div class="num">500.000đ</div>
        </div>

        <div class="payment-method">
            <h4 style="margin:10px 0 8px 0">Phương thức thanh toán</h4>
            <div class="pm-item"><img src="../../images/image_product/logoNH.png" alt="bank">
                <div>Chuyển khoản ngân hàng</div>
            </div>
            <div class="pm-item"><img src="../../images/image_product/momo.png" alt="momo">
                <div>Ví điện tử Momo</div>
            </div>
            <div class="pm-item"><img src="../../images/image_product/visa.png" alt="visa">
                <div>Thẻ Visa</div>
            </div>
            <div class="pm-item"><img src="../../images/image_product/logothanhtoan.png" alt="cod">
                <div>Thanh toán khi giao hàng</div>
            </div>
        </div>

        <div style="display:flex;gap:10px;margin-top:14px;flex-direction: row-reverse;">
            <button class="btn" onclick="location.href='index.html'">Tiếp tục mua sắm</button>
        </div>

    </aside>

</div>

<footer class="site-footer">
    <div class="footer-top-bar">
        <div class="footer-contact-row">
            <div class="footer-contact-item">
                <a href="tel:+84000000000">
                    <i class="fas fa-phone-alt"></i>
                    <span>Hotline: +84 000 000 000</span>
                </a>
            </div>
            <div class="footer-contact-item">
                <a href="mailto:contact@gmail.com">
                    <i class="fas fa-envelope"></i>
                    <span>contact@gmail.com</span>
                </a>
            </div>
        </div>
    </div>

    <div class="footer-main-content">
        <div class="footer-columns">
            <!-- Social & Newsletter Column -->
            <div class="footer-social-column">
                <h2 class="footer-column-title">Đăng ký nhận tin khuyến mãi</h2>

                <form class="newsletter-form" action="/account/contact" method="post">
                    <input name="form_type" type="hidden" value="customer">
                    <input name="utf8" type="hidden" value="✓">
                    <input type="hidden" name="contact[tags]" value="khách hàng tiềm năng, bản tin"/>

                    <div class="newsletter-input-wrapper">
                        <input required type="email" name="contact[email]" class="newsletter-email-input"
                               placeholder="Nhập email của bạn">
                        <button class="newsletter-submit-btn" type="submit" aria-label="submit form">
                            <i class="fas fa-paper-plane"></i>
                        </button>
                    </div>
                </form>

                <div class="social-links-list">
                    <a href="https://www.facebook.com/" aria-label="Facebook" target="_blank">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="https://www.linkedin.com/" aria-label="LinkedIn" target="_blank">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a href="https://www.instagram.com/" aria-label="Instagram" target="_blank">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="https://www.youtube.com/" aria-label="YouTube" target="_blank">
                        <i class="fab fa-youtube"></i>
                    </a>
                    <a href="https://www.tiktok.com/" aria-label="TikTok" target="_blank">
                        <i class="fab fa-tiktok"></i>
                    </a>
                    <a href="https://zalo.me/" aria-label="Zalo" target="_blank">
                        <i class="fas fa-comment-dots"></i>
                    </a>
                </div>

                <div class="app-download-section">
                    <h3>Tải app</h3>
                    <div class="app-download-links">
                        <a href="https://apps.apple.com/" target="_blank" class="app-badge">
                            <img src="../../images/app-download/appstore.png" alt="App Store">
                        </a>
                        <a href="https://play.google.com/" target="_blank" class="app-badge">
                            <img src="../../images/app-download/googleplaystore.png" alt="Play Store">
                        </a>
                    </div>
                </div>
            </div>

            <!-- About Column -->
            <div class="footer-column">
                <h3 class="footer-column-title">Về StyleEra</h3>
                <ul class="footer-menu-list">
                    <li><a href=""><i class="fas fa-chevron-right"></i> Giới Thiệu</a></li>
                    <li><a href=""><i class="fas fa-chevron-right"></i> Công Nghệ Sản Xuất</a></li>
                    <li><a href=""><i class="fas fa-chevron-right"></i> Cơ Hội Việc Làm</a></li>
                    <li><a href=""><i class="fas fa-chevron-right"></i> Hệ Thống Cửa Hàng</a></li>
                    <li><a href=""><i class="fas fa-chevron-right"></i> Tạp Chí Thời Trang</a></li>
                </ul>
            </div>

            <!-- Account Column -->
            <div class="footer-column">
                <h3 class="footer-column-title">Tài khoản</h3>
                <ul class="footer-menu-list">
                    <li><a href="/account/login"><i class="fas fa-chevron-right"></i> Đăng nhập/Đăng ký</a></li>
                    <li><a href="/account"><i class="fas fa-chevron-right"></i> Lịch sử mua hàng</a></li>
                    <li><a href="/account/addresses"><i class="fas fa-chevron-right"></i> Danh sách địa chỉ</a></li>
                </ul>
            </div>

            <!-- Support Column -->
            <div class="footer-column">
                <h3 class="footer-column-title">Hỗ trợ khách hàng</h3>
                <ul class="footer-menu-list">
                    <li><a href="/pages/chinh-sach-thanh-vien"><i class="fas fa-chevron-right"></i> Chính Sách Thành
                        Viên</a></li>
                    <li><a href="/pages/chinh-sach-doi-hang"><i class="fas fa-chevron-right"></i> Chính Sách Đổi
                        Hàng</a></li>
                    <li><a href="/pages/chinh-sach-bao-hanh"><i class="fas fa-chevron-right"></i> Chính Sách Bảo
                        Hành</a></li>
                    <li><a href="/pages/huong-dan-mua-hang"><i class="fas fa-chevron-right"></i> Hướng Dẫn Mua Hàng</a>
                    </li>
                    <li><a href="/pages/huong-dan-chon-size"><i class="fas fa-chevron-right"></i> Hướng Dẫn Chọn
                        Size</a></li>
                    <li><a href="/pages/contact-us"><i class="fas fa-chevron-right"></i> Câu Hỏi Thường Gặp</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="footer-bottom-bar">
        <i class="far fa-copyright"></i> 2025 StyleEra. All rights reserved.
    </div>
</footer>

<script src="../../js/checkout.js"></script>
<script src="../../js/main.js"></script>
</body>

</html>