<%@ page import="com.clothingshop.styleera.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.clothingshop.styleera.model.Image" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleEra - Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${root}/css/header-footer.css">
    <link rel="stylesheet" href="${root}/css/product.css">
</head>

<body>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    Map<Integer, Image> thumbnailImg = (Map<Integer, Image>) request.getAttribute("thumbnailImg");

%>
<!-- ===== HEADER ===== -->
<jsp:include page="/views/layout/header.jsp" />

<!-- ===== MAIN CONTENT ===== -->
<main class="container product-page">

    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mt-3 mb-3">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.jsp">Trang Chủ</a></li>
            <li class="breadcrumb-item active" id="breadcrumb-category">Danh mục</li>
        </ol>
    </nav>

    <div class="row">

        <!-- =========== BÊN TRÁI: FILTER =========== -->
        <aside class="col-lg-3 col-md-4">
            <div class="filter-box">

                <h5 class="filter-title">Danh Mục Sản Phẩm</h5>

                <!-- DANH MỤC NAM -->
                <div class="filter-section">
                    <h6>Nam</h6>
                    <ul>
                        <li><a href="product.html">Tất cả Nam</a></li>
                        <li><a href="product.html">Áo Thun</a></li>
                        <li><a href="product.html">Áo Polo</a></li>
                        <li><a href="product.html">Áo Khoác</a></li>
                        <li><a href="product.html">Quần Jean</a></li>
                        <li><a href="product.html">Quần Short</a></li>
                    </ul>
                </div>

                <!-- DANH MỤC NỮ -->
                <div class="filter-section">
                    <h6>Nữ</h6>
                    <ul>
                        <li><a href="product.html">Tất cả Nữ</a></li>
                        <li><a href="product.html">Áo Thun</a></li>
                        <li><a href="product.html">Áo Polo</a></li>
                        <li><a href="product.html">Áo Khoác</a></li>
                        <li><a href="product.html">Chân / Váy</a></li>
                    </ul>
                </div>

                <!-- DANH MỤC ĐỒ ĐÔI -->
                <div class="filter-section">
                    <h6>Đồ Đôi</h6>
                    <ul>
                        <li><a href="product.html">Tất cả Đồ Đôi</a></li>
                        <li><a href="product.html">Áo Thun Đôi</a></li>
                        <li><a href="product.html">Áo Khoác Đôi</a></li>
                    </ul>
                </div>

                <hr>

                <!-- BỘ LỌC GIÁ -->
                <div class="filter-section">
                    <h6>Giá</h6>
                    <ul>
                        <li><input type="checkbox"> Dưới 200.000</li>
                        <li><input type="checkbox"> 200.000 – 300.000</li>
                        <li><input type="checkbox"> 300.000 – 500.000</li>
                        <li><input type="checkbox"> Trên 500.000</li>
                    </ul>
                </div>

                <!-- BỘ LỌC SIZE -->
                <div class="filter-section">
                    <h6>Kích thước</h6>
                    <ul class="size-list">
                        <li>
                            <button>S</button>
                        </li>
                        <li>
                            <button>M</button>
                        </li>
                        <li>
                            <button>L</button>
                        </li>
                        <li>
                            <button>XL</button>
                        </li>
                        <li>
                            <button>XXL</button>
                        </li>
                    </ul>
                </div>

                <!-- BỘ LỌC MÀU SẮC -->
                <div class="filter-section">
                    <h6>Màu sắc</h6>
                    <ul class="color-list">
                        <li><span class="color-dot" style="background:#000"></span> Đen</li>
                        <li><span class="color-dot" style="background:#fff; border:1px solid #ccc"></span> Trắng</li>
                        <li><span class="color-dot" style="background:#e63946"></span> Đỏ</li>
                        <li><span class="color-dot" style="background:#1d3557"></span> Xanh</li>
                    </ul>
                </div>

            </div>
        </aside>

        <!-- =========== BÊN PHẢI: PRODUCT LISTING =========== -->
        <section class="col-lg-9 col-md-8">

            <!-- Tiêu đề danh mục -->
            <h2 class="category-title" id="category-title">Tên Danh Mục</h2>

            <!-- Sắp xếp -->
            <div class="sort-bar d-flex justify-content-end mb-3">
                <select class="form-select w-auto">
                    <option selected>Sắp xếp</option>
                    <option>Giá tăng dần</option>
                    <option>Giá giảm dần</option>
                    <option>Mới nhất</option>
                </select>
            </div>

            <!-- Danh sách sản phẩm -->
            <div class="row g-3" id="product-list">
                <% for (Product p: products){
                    Image thumb = (thumbnailImg == null || thumbnailImg.isEmpty()) ? null : thumbnailImg.get(p.getId());
                    String imgPath = request.getContextPath() + "/images/no-image.png";
                    if (thumb != null && thumb.getImagePath() != null && !thumb.getImagePath().isEmpty()) {
                        imgPath = request.getContextPath() + thumb.getImagePath();
                    }

                %>
                <!-- ===== SẢN PHẨM NAM ===== -->
                <div class="col-lg-4 col-md-6 col-6"  id="<%=p.getId()%>">
                    <a href="${root}/Product_DetailController?id=<%=p.getId()%>"  class="product-card-link">
                        <div class="product-card">
                            <div class="product-image">
                                <span class="product-badge badge-new">NEW</span>
                                <img src="<%= imgPath %>" alt="<%=p.getProductName()%>">
                            </div>
                            <h5 class="product-name"><%=p.getProductName()%></h5>
                            <p class="product-price"><%=p.getPrice()%> VNĐ</p>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                        </div>
                        <button class="btn-cart">
                            <i class="fas fa-shopping-cart"></i>
                        </button>
                    </a>

                </div>
                <% } %>

            </div>

        </section>
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