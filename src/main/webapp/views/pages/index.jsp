<%@ page import="com.clothingshop.styleera.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="root" value="${pageContext.request.contextPath}" scope="request"/>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleEra - Thời Trang Cho Mọi Người</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${root}/css/header-footer.css">
    <link rel="stylesheet" href="${root}/css/style.css">
</head>

<body>
<!-- ===== HEADER ===== -->
<jsp:include page="/views/layout/header.jsp"/>

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-slider">
            <div class="hero-slide active">
                <img src="${root}/images/slide/slide-01.jpg" alt="Fashion Banner 1">
            </div>
            <div class="hero-slide">
                <img src="${root}/images/slide/slide-02.jpg" alt="Fashion Banner 2">
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
                <%
                    List<Product> newArrivals = (List<Product>) request.getAttribute("newArrivals");
                    if (newArrivals != null) {
                        for (Product p : newArrivals) {
                            // Kiểm tra null cho ảnh
                            String imgPath = (p.getThumbnail() != null) ? request.getContextPath() + p.getThumbnail() : request.getContextPath() + "/images/no-image.png";
                %>
                <a href="${root}/Product_DetailController?id=<%=p.getProduct_id()%>" class="product-card-link">
                    <div class="product-card">
                        <div class="product-image">
                            <span class="product-badge badge-new">NEW</span>
                            <img src="<%=imgPath%>" alt="<%=p.getProduct_name()%>">
                        </div>
                        <div class="product-info">
                            <h4><%=p.getProduct_name()%>
                            </h4>
                            <div class="product-rating">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                    class="fas fa-star"></i><i class="fas fa-star"></i>
                            </div>
                            <div class="product-price">
                                <span class="price"><%=String.format("%,.0f", p.getPrice())%>₫</span>
                            </div>
                            <button class="btn-cart"><i class="fas fa-shopping-cart"></i></button>
                        </div>
                    </div>
                </a>
                <% }
                }
                %>
            </div>
            <div class="section-footer">
                <a href="${root}/product?sort=newest" class="btn-view-all">Xem Tất Cả</a>
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
                <%
                    List<Product> bestSellers = (List<Product>) request.getAttribute("bestSellers");
                    if (bestSellers != null && !bestSellers.isEmpty()) {
                        for (Product p : bestSellers) {
                            // Xử lý ảnh thumbnail
                            String imgPath = (p.getThumbnail() != null)
                                    ? request.getContextPath() + p.getThumbnail()
                                    : request.getContextPath() + "/images/no-image.png";
                %>
                <a href="${root}/Product_DetailController?id=<%=p.getProduct_id()%>" class="product-card-link">
                    <div class="product-card">
                        <div class="product-image">
                            <span class="product-badge badge-bestseller">BEST SELLER</span>
                            <img src="<%=imgPath%>" alt="<%=p.getProduct_name()%>">
                        </div>
                        <div class="product-info">
                            <h4><%=p.getProduct_name()%>
                            </h4>
                            <div class="product-rating">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                    class="fas fa-star"></i><i class="fas fa-star"></i>
                            </div>
                            <div class="product-price">
                                <span class="price"><%=String.format("%,.0f", p.getPrice())%>₫</span>
                            </div>
                            <button class="btn-cart"><i class="fas fa-shopping-cart"></i></button>
                        </div>
                    </div>
                </a>
                <% }
                } else {
                %>
                <p class="text-center">Đang cập nhật sản phẩm bán chạy...</p>
                <% } %>
            </div>
            <div class="section-footer">
                <a href="${root}/product?sort=bestseller" class="btn-view-all">Xem Tất Cả</a>
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
                <img src="${root}/images/category-banner/banner/male-fashion.jpg" alt="Thời trang nam">
                <div class="collection-overlay">
                    <h3>Thời Trang Nam</h3>
                    <p>Phong cách lịch lãm - Năng động - Cá tính</p>
                    <a href="${root}/product?parentId=1" class="collection-link">
                        Khám Phá <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>

            <div class="collection-card">
                <img src="${root}/images/category-banner/banner/female-fashion.jpg" alt="Thời trang nữ">
                <div class="collection-overlay">
                    <h3>Thời Trang Nữ</h3>
                    <p>Thanh lịch - Tinh tế - Quyến rũ</p>
                    <a href="${root}/product?parentId=2" class="collection-link">
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
                    <a href="${root}/product?cateId=1" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/man/ao-khoac-nam.png" alt="Áo Khoác Nam"
                                 class="img-fluid rounded">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Khoác Nam</h4>
                            <p>Phong cách & ấm áp</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=2" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/man/ao-thun-nam.png" alt="Áo Thun Nam">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Thun Nam</h4>
                            <p>Thoải mái & năng động</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=3" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/man/ao-polo-nam.png" alt="Áo Polo Nam">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Polo Nam</h4>
                            <p>Lịch sự & thanh lịch</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=4" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/man/ao-so-mi-nam.png" alt="Áo Sơ Mi Nam">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Sơ Mi Nam</h4>
                            <p>Chuyên nghiệp & sang trọng</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=5" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/man/quan-short-nam.png"
                                 alt="Quần Short Nam">
                        </div>
                        <div class="category-item-content">
                            <h4>Quần Short Nam</h4>
                            <p>Mát mẻ & thoải mái</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=6" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/man/quan-tay-nam.png" alt="Quần Dài Nam">
                        </div>
                        <div class="category-item-content">
                            <h4>Quần Dài Nam</h4>
                            <p>Lịch lãm & trẻ trung</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=7" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/man/quan-jean-nam.png"
                                 alt="Quần Jean Nam">
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
                    <a href="${root}/product?cateId=8" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/woman/ao-khoac-nu.png" alt="Áo Khoác Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Khoác Nữ</h4>
                            <p>Sang trọng & ấm áp</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=9" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/woman/ao-thun-nu.png" alt="Áo Thun Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Thun Nữ</h4>
                            <p>Năng động & trẻ trung</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=10" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/woman/ao-polo-nu.png" alt="Áo Polo Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Polo Nữ</h4>
                            <p>Năng động & thanh lịch</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=11" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/woman/ao-so-mi-nu.png" alt="Áo Sơ Mi Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Sơ Mi Nữ</h4>
                            <p>Thanh lịch & nữ tính</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=12" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/woman/vay-nu.png" alt="Váy Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Váy Nữ</h4>
                            <p>Duyên dáng & quyến rũ</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=13" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/woman/dam-nu.png" alt="Đầm Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Đầm Nữ</h4>
                            <p>Sang trọng & lộng lẫy</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=14" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/woman/quan-short-nu.png"
                                 alt="Quần Short Nữ">
                        </div>
                        <div class="category-item-content">
                            <h4>Quần Short Nữ</h4>
                            <p>Thoải mái & năng động</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=15" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/woman/quan-dai-nu.png" alt="Quần Dài Nữ">
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
                    <a href="${root}/product?cateId=16" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/couple/ao-thun-doi.png" alt="Áo Thun Đôi"
                                 class="img-fluid rounded">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Thun Đôi</h4>
                            <p>Tình yêu & gắn kết</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=17" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/couple/ao-khoac-doi.png"
                                 alt="Áo Khoác Đôi"
                                 class="img-fluid rounded">
                        </div>
                        <div class="category-item-content">
                            <h4>Áo Khoác Đôi</h4>
                            <p>Ấm áp & lãng mạn</p>
                        </div>
                    </a>
                    <a href="${root}/product?cateId=18" class="category-item-card">
                        <div class="category-item-image">
                            <img src="${root}/images/category-banner/category/couple/do-bo-doi.png" alt="Đồ Bộ Đôi"
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
<jsp:include page="/views/layout/footer.jsp"/>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom JavaScript -->
<script src="${root}/js/main.js"></script>
<script src="${root}/js/home.js"></script>
<script src="login.jsp"></script>

</body>
</html>
