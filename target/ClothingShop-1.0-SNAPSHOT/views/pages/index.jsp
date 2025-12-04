<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleEra - Thời Trang Cho Mọi Người</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../../css/header-footer.css">
    <link rel="stylesheet" href="../../css/home.css">
</head>

<body>
<!-- ===== HEADER ===== -->
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
                <a href="index.html" aria-label="home">
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
                        <a class="nav-link-primary" href="index.html">TRANG CHỦ</a>
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

                <a href="../../admin/admin-login.jsp" class="admin-link" title="Quản trị viên">
                    <i class="fas fa-user-cog" style="color: black;"></i>
                </a>
                <div class="account-dropdown-wrapper">
                    <a href="login.jsp" class="account-link" title="Khách hàng">
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

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-slider">
            <div class="hero-slide active">
                <img src="../../images/slide/slide-01.jpg" alt="Fashion Banner 1">
            </div>
            <div class="hero-slide">
                <img src="../../images/slide/slide-02.jpg" alt="Fashion Banner 2">
            </div>
        </div>
        <div class="hero-overlay">
            <div class="hero-content">
                <h1>Định Nghĩa Phong Cách Của Bạn</h1>
                <p>Khám phá bộ sưu tập thời trang hiện đại - Nơi phong cách gặp gỡ sự tự tin</p>
                <div class="hero-buttons">
                    <a href="#collections" class="btn-hero btn-hero-primary">Khám Phá Ngay</a>
                    <a href="#new-arrivals" class="btn-hero btn-hero-secondary">Hàng Mới Về</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features-section">
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-shipping-fast"></i>
                </div>
                <h3>Miễn Phí Vận Chuyển</h3>
                <p>Giao hàng miễn phí cho đơn hàng trên 500.000đ</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-undo-alt"></i>
                </div>
                <h3>Đổi Trả Dễ Dàng</h3>
                <p>Đổi trả trong vòng 30 ngày miễn phí</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h3>Thanh Toán An Toàn</h3>
                <p>Bảo mật thông tin với công nghệ mã hóa</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-headset"></i>
                </div>
                <h3>Hỗ Trợ 24/7</h3>
                <p>Đội ngũ chăm sóc khách hàng luôn sẵn sàng</p>
            </div>
        </div>
    </section>

    <!-- New Arrivals Section -->
    <section id="new-arrivals" class="products-section">
        <div class="products-container">
            <div class="section-header">
                <h2>Hàng Mới Về</h2>
                <p>Cập nhật những xu hướng thời trang mới nhất</p>
            </div>
            <div class="products-grid">
                <!-- Product 1 -->
                <a href="product_detail.jsp" class="product-card-link">
                    <div class="product-card">
                        <div class="product-image">
                            <span class="product-badge badge-new">NEW</span>
                            <img src="../../images/category-banner/category/man/ao-khoac-nam.png" alt="Piqué Biker Jacket">
                        </div>
                        <div class="product-info">
                            <h4>Piqué Biker Jacket</h4>
                            <div class="product-rating">
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <div class="product-price">
                                <span class="price">1.680.000₫</span>
                            </div>
                            <button class="btn-cart">
                                <i class="fas fa-shopping-cart"></i>
                            </button>
                        </div>
                    </div>
                </a>

                <!-- Product 2 -->
                <a href="product_detail.jsp" class="product-card-link">
                    <div class="product-card">
                        <div class="product-image">
                            <span class="product-badge badge-new">NEW</span>
                            <img src="../../images/category-banner/category/man/ao-polo-nam.png" alt="Multi-pocket Chest Bag">
                        </div>
                        <div class="product-info">
                            <h4>Multi-pocket Chest Bag</h4>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <div class="product-price">
                                <span class="price">1.520.000₫</span>
                            </div>
                            <button class="btn-cart">
                                <i class="fas fa-shopping-cart"></i>
                            </button>
                        </div>
                    </div>
                </a>

                <!-- Product 3 -->
                <a href="product_detail.jsp" class="product-card-link">
                    <div class="product-card">
                        <div class="product-image">
                            <span class="product-badge badge-new">NEW</span>
                            <img src="../../images/category-banner/category/man/ao-so-mi-nam.png" alt="Diagonal Textured Cap">
                        </div>
                        <div class="product-info">
                            <h4>Diagonal Textured Cap</h4>
                            <div class="product-rating">
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <div class="product-price">
                                <span class="price">1.522.500₫</span>
                            </div>
                            <button class="btn-cart">
                                <i class="fas fa-shopping-cart"></i>
                            </button>
                        </div>
                    </div>
                </a>

                <!-- Product 4 -->
                <a href="product_detail.jsp" class="product-card-link">
                    <div class="product-card">
                        <div class="product-image">
                            <span class="product-badge badge-new">NEW</span>
                            <img src="../../images/category-banner/category/man/ao-thun-nam.png" alt="Lether Backpack">
                        </div>
                        <div class="product-info">
                            <h4>Lether Backpack</h4>
                            <div class="product-rating">
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <div class="product-price">
                                <span class="price">784.250₫</span>
                            </div>
                            <button class="btn-cart">
                                <i class="fas fa-shopping-cart"></i>
                            </button>
                        </div>
                    </div>
                </a>
            </div>
            <div class="section-footer">
                <a href="product.jsp" class="btn-view-all">Xem Tất Cả</a>
            </div>
        </div>
    </section>

    <!-- Best Sellers Section -->
    <section class="products-section bg-light">
        <div class="products-container">
            <div class="section-header">
                <h2>Sản Phẩm Bán Chạy</h2>
                <p>Những sản phẩm được yêu thích nhất</p>
            </div>
            <div class="products-grid">
                <!-- Product 1 -->
                <a href="product_detail.jsp" class="product-card-link">
                    <div class="product-card">
                        <div class="product-image">
                            <span class="product-badge badge-bestseller">BEST SELLER</span>
                            <img src="../../images/category-banner/category/woman/ao-khoac-nu.png" alt="Ankle Boots">
                        </div>
                        <div class="product-info">
                            <h4>Ankle Boots</h4>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <div class="product-price">
                                <span class="price">2.458.725₫</span>
                            </div>
                            <button class="btn-cart">
                                <i class="fas fa-shopping-cart"></i>
                            </button>
                        </div>
                    </div>
                </a>

                <!-- Product 2 -->
                <a href="product_detail.jsp" class="product-card-link">
                    <div class="product-card">
                        <div class="product-image">
                            <span class="product-badge badge-bestseller">BEST SELLER</span>
                            <img src="../../images/category-banner/category/woman/ao-thun-nu.png"
                                 alt="T-shirt Contrast Pocket">
                        </div>
                        <div class="product-info">
                            <h4>T-shirt Contrast Pocket</h4>
                            <div class="product-rating">
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <div class="product-price">
                                <span class="price">1.241.500₫</span>
                            </div>
                            <button class="btn-cart">
                                <i class="fas fa-shopping-cart"></i>
                            </button>
                        </div>
                    </div>
                </a>

                <!-- Product 3 -->
                <a href="product_detail.jsp" class="product-card-link">
                    <div class="product-card">
                        <div class="product-image">
                            <span class="product-badge badge-bestseller">BEST SELLER</span>
                            <img src="../../images/category-banner/category/woman/ao-polo-nu.png" alt="Basic Flowing Scarf">
                        </div>
                        <div class="product-info">
                            <h4>Basic Flowing Scarf</h4>
                            <div class="product-rating">
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <div class="product-price">
                                <span class="price">657.000₫</span>
                            </div>
                            <button class="btn-cart">
                                <i class="fas fa-shopping-cart"></i>
                            </button>
                        </div>
                    </div>
                </a>

                <!-- Product 4 -->
                <a href="product_detail.jsp" class="product-card-link">
                    <div class="product-card">
                        <div class="product-image">
                            <span class="product-badge badge-bestseller">BEST SELLER</span>
                            <img src="../../images/category-banner/category/woman/ao-so-mi-nu.png"
                                 alt="Textured Knit Sweater">
                        </div>
                        <div class="product-info">
                            <h4>Textured Knit Sweater</h4>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="product-price">
                                <span class="price">1.890.000₫</span>
                            </div>
                            <button class="btn-cart">
                                <i class="fas fa-shopping-cart"></i>
                            </button>
                        </div>
                    </div>
                </a>
            </div>
            <div class="section-footer">
                <a href="product.jsp" class="btn-view-all">Xem Tất Cả</a>
            </div>
        </div>
    </section>

    <!-- Collections Banner -->
    <section id="collections" class="collections-section">
        <div class="section-header">
            <h2>Bộ Sưu Tập Nổi Bật</h2>
            <p>Khám phá các bộ sưu tập thời trang được yêu thích nhất</p>
        </div>
        <div class="collections-grid">
            <div class="collection-card">
                <img src="../../images/category-banner/banner/male-fashion.jpg" alt="Thời trang nam">
                <div class="collection-overlay">
                    <h3>Thời Trang Nam</h3>
                    <p>Phong cách lịch lãm - Năng động - Cá tính</p>
                    <a href="product.jsp" class="collection-link">
                        Khám Phá <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
            <div class="collection-card">
                <img src="../../images/category-banner/banner/female-fashion.jpg" alt="Thời trang nữ">
                <div class="collection-overlay">
                    <h3>Thời Trang Nữ</h3>
                    <p>Thanh lịch - Tinh tế - Quyến rũ</p>
                    <a href="product.jsp" class="collection-link">
                        Khám Phá <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="categories-section py-5">
        <div class="container">
            <!-- Header -->
            <div class="section-header text-center mb-5">
                <h2 class="fw-bold">Danh Mục Sản Phẩm</h2>
                <p>Tìm kiếm sản phẩm yêu thích của bạn</p>
            </div>

            <!-- ===== Nam ===== -->
            <div class="category-group mb-5">
                <div class="category-group-header d-flex align-items-center mb-3">
                    <div class="category-icon male me-3">
                        <i class="fas fa-mars fa-2x"></i>
                    </div>
                    <h3 class="mb-0">Thời Trang Nam</h3>
                </div>
                <div class="category-items-grid row g-4">
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/man/ao-khoac-nam.png" alt="Áo Khoác Nam"
                                 class="img-fluid rounded">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Khoác Nam</h4>
                            <p>Phong cách & ấm áp</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/man/ao-thun-nam.png" alt="Áo Thun Nam">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Thun Nam</h4>
                            <p>Thoải mái & năng động</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/man/ao-polo-nam.png" alt="Áo Polo Nam">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Polo Nam</h4>
                            <p>Lịch sự & thanh lịch</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/man/ao-so-mi-nam.png" alt="Áo Sơ Mi Nam">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Sơ Mi Nam</h4>
                            <p>Chuyên nghiệp & sang trọng</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/man/quan-short-nam.png" alt="Quần Short Nam">
                        </div>
                        <div class="category-item-content">
                            <h4>Quần Short Nam</h4>
                            <p>Mát mẻ & thoải mái</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/man/quan-tay-nam.png" alt="Quần Dài Nam">
                        </div>
                        <div class="category-item-content">
                            <h4>Quần Dài Nam</h4>
                            <p>Lịch lãm & trẻ trung</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/man/quan-jean-nam.png" alt="Quần Jean Nam">
                        </div>
                        <div class="category-item-content">
                            <h4>Quần Jean Nam</h4>
                            <p>Bền bỉ & thời trang</p>
                        </div>
                    </a>
                </div>
            </div>

            <!-- Nữ -->
            <div class="category-group">
                <div class="category-group-header">
                    <div class="category-icon female">
                        <i class="fas fa-venus"></i>
                    </div>
                    <h2>Thời Trang Nữ</h2>
                </div>
                <div class="category-items-grid">
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/woman/ao-khoac-nu.png" alt="Áo Khoác Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Khoác Nữ</h4>
                            <p>Sang trọng & ấm áp</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/woman/ao-thun-nu.png" alt="Áo Thun Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Thun Nữ</h4>
                            <p>Năng động & trẻ trung</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/woman/ao-polo-nu.png" alt="Áo Polo Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Polo Nữ</h4>
                            <p>Năng động & thanh lịch</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/woman/ao-so-mi-nu.png" alt="Áo Sơ Mi Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Sơ Mi Nữ</h4>
                            <p>Thanh lịch & nữ tính</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/woman/vay-nu.png" alt="Váy Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Váy Nữ</h4>
                            <p>Duyên dáng & quyến rũ</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/woman/dam-nu.png" alt="Đầm Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Đầm Nữ</h4>
                            <p>Sang trọng & lộng lẫy</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/woman/quan-short-nu.png" alt="Quần Short Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Quần Short Nữ</h4>
                            <p>Thoải mái & năng động</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/woman/quan-dai-nu.png" alt="Quần Dài Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Quần Dài Nữ</h4>
                            <p>Thanh lịch & hiện đại</p>
                        </div>
                    </a>
                </div>
            </div>

            <!-- ===== Đồ Đôi ===== -->
            <div class="category-group">
                <div class="category-group-header d-flex align-items-center mb-3">
                    <div class="category-icon couple me-3">
                        <i class="fas fa-heart fa-2x"></i>
                    </div>
                    <h3 class="mb-0">Đồ Đôi</h3>
                </div>
                <div class="category-items-grid">
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/couple/ao-thun-doi.png" alt="Áo Thun Đôi"
                                 class="img-fluid rounded">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Thun Đôi</h4>
                            <p>Tình yêu & gắn kết</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/couple/ao-khoac-doi.png" alt="Áo Khoác Đôi"
                                 class="img-fluid rounded">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Khoác Đôi</h4>
                            <p>Ấm áp & lãng mạn</p>
                        </div>
                    </a>
                    <a href="product.jsp" class="category-item-card">
                        <div class="category-item-image">
                            <img src="../../images/category-banner/category/couple/do-bo-doi.png" alt="Đồ Bộ Đôi"
                                 class="img-fluid rounded">
                        </div>
                        <div class="category-item-content">
                            <h4>Đồ Bộ Đôi</h4>
                            <p>Hoàn hảo & hài hòa</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
</main>


<!-- ===== FOOTER ===== -->
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
                    <li><a href="login.jsp"><i class="fas fa-chevron-right"></i> Đăng nhập/Đăng ký</a></li>
                    <li><a href="order-history.jsp"><i class="fas fa-chevron-right"></i> Lịch sử mua hàng</a></li>
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

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom JavaScript -->
<script src="../../js/main.js"></script>
<script src="../../js/home.js"></script>
<script src="login.jsp"></script>
</body>
</html>
