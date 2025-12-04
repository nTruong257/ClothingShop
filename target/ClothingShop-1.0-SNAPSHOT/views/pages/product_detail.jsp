<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleEra - Sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../../css/header-footer.css">
    <link rel="stylesheet" href="../../css/product_detail.css">
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

<!-- ===== MAIN CONTENT ===== -->
<main class="main-content">
    <!-- Content goes here -->
    <div class="product_detail_container">
        <div class="product_detail_wrapper">

            <!-- LEFT: PRODUCT IMAGES -->
            <div class="product_images">
                <div class="product_main_image">
                    <img id="mainImage" src="../../images/image_product/anh1.png" alt="Ảnh chính">
                </div>

                <div class="product_thumbs">
                    <img src="../../images/image_product/anh1.png" alt="Ảnh nhỏ 1">
                    <img src="../../images/image_product/anh4.png" alt="Ảnh nhỏ 1">
                    <img src="../../images/image_product/anh2.png" alt="Ảnh nhỏ 2">
                    <img src="../../images/image_product/anh3.png" alt="Ảnh nhỏ 3">
                </div>
            </div>

            <!-- RIGHT: PRODUCT INFO -->
            <div class="product_info">
                <h2 class="product_title">Áo polo nam BASIC SYMBOL vải cá sấu cotton interlock xuất xịn,
                    thanh lịch, sang trọng - POLOMANOR</h2>

                <div class="rating">
                    <img src="../../images/image_product/start.png">
                    <img src="../../images/image_product/start.png">
                    <img src="../../images/image_product/start.png">
                    <img src="../../images/image_product/start.png">
                    <img src="../../images/image_product/start.png">
                    <span>- Đánh giá 5</span>
                </div>

                <h3 class="product_price">1.173.000đ<span>99.000đ</span></h3>

                <p class="product_desc">
                    Áo polo nam chất liệu cá sấu cotton interlock cao cấp, bề mặt mềm mịn, thấm hút tốt;
                    thiết kế cổ bẻ, tay ngắn chuẩn form tạo vẻ ngoài lịch sự và sang trọng.
                </p>

                <div class="product_detail_option">

                    <!-- SIZE -->
                    <div class="product_detail_size">
                        <span>Size:</span>
                        <label>S</label>
                        <label>M</label>
                        <label>L</label>
                        <label class="active">XL</label>
                        <label>XXL</label>
                    </div>

                    <!-- COLOR -->
                    <div class="product_detail_color">
                        <span>Color:</span>
                        <img src="../../images/image_product/den.png">
                        <img src="../../images/image_product/trắng.png">
                        <img src="../../images/image_product/đỏ.png">
                        <img src="../../images/image_product/xanhduong.png">
                    </div>
                    <div class="product_detail_quantity">
                        <label for="quantity">Số lượng:</label>
                        <button type="button" id="btn-decrease">−</button>
                        <input type="number" id="quantity" value="1" min="1" readonly>
                        <button type="button" id="btn-increase">+</button>
                    </div>
                </div>
                <button type="button" class="btn btn-primary validate_order"
                        onclick="window.location.href='checkout.html'">Mua hàng
                </button>
                <button type="button" class="btn btn-primary validate_order">Thêm vào giỏ hàng
                </button>
            </div>
        </div>
    </div>

    <div class="row_2">
        <div class="colum">
            <div class="product_detail_tab">
                <ul class="nav">
                    <li class="nav_item">
                        <a class="nav-link active" data-tab="tabs-5">MÔ TẢ</a>
                    </li>

                    <li class="nav_item">
                        <a class="nav-link" data-tab="tabs-7">THÔNG TIN BỔ SUNG</a>
                    </li>
                </ul>

                <div class="tab_content">
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-5" role="tabpanel">
                            <div class="product_details_tab_content">
                                <p class="note">Thời điểm này chỉ là tạm thời, nhưng nó lại tạo nên một bố
                                    cục hài hòa ở giữa, không có bất kỳ yêu cầu phức tạp nào. Pellentesque
                                    diam dolor, một phần tử giúp bố cục gọn gàng hơn nhờ sự liên kết và mềm
                                    mại khi hiển thị. Phần nội dung này được thiết kế để hỗ trợ cấu trúc
                                    tổng thể, đồng thời tăng tính trực quan và dễ chịu khi người dùng trải
                                    nghiệm.</p>
                                <div class="product_details_tab_content_item">
                                    <h5>THÔNG TIN SẢN PHẨM</h5>
                                    <p>Một Pocket PC là một loại máy tính cầm tay, sở hữu nhiều chức năng
                                        tương tự như một máy tính cá nhân hiện đại. Những thiết bị nhỏ gọn
                                        này cho phép người dùng nhận và lưu trữ email, tạo danh sách liên
                                        hệ, sắp xếp lịch hẹn, lướt Internet, gửi tin nhắn văn bản và nhiều
                                        tính năng khác. Mỗi sản phẩm được gọi là Pocket PC phải được trang
                                        bị phần mềm chuyên dụng để vận hành thiết bị và phải có màn hình cảm
                                        ứng cùng touchpad.</p>
                                    <p>Giống như bất kỳ sản phẩm công nghệ mới nào, giá của Pocket PC trong
                                        thời kỳ đầu ra mắt rất cao. Vào khoảng năm 2003, người tiêu dùng
                                        phải chi khoảng 700 USD để sở hữu một trong những mẫu Pocket PC cao
                                        cấp nhất. Ngày nay, khách hàng có thể thấy mức giá đã trở nên hợp lý
                                        hơn nhiều khi độ “hot” ban đầu đã giảm. Hiện tại, với khoảng 350
                                        USD, bạn đã có thể mua một chiếc Pocket PC mới.</p>
                                </div>
                                <div class="product_details_tab_content_item">
                                    <h5>CHẤT LIỆU SỬ DỤNG</h5>
                                    <p>Polyester được xem là chất liệu có chất lượng thấp hơn do không phải
                                        là sợi tự nhiên. Chất liệu này được tạo ra từ sợi tổng hợp, không tự
                                        nhiên như len. Những bộ suit làm từ polyester dễ bị nhăn và nổi
                                        tiếng với đặc tính không thoáng khí. Ngoài ra, suit polyester thường
                                        có độ bóng nhẹ so với suit bằng len hoặc cotton, điều này có thể
                                        khiến trang phục trông kém sang trọng.

                                        Ngược lại, chất liệu nhung (velvet) có kết cấu mềm mịn, sang trọng
                                        và thoáng khí. Velvet là lựa chọn tuyệt vời cho áo khoác dự tiệc tối
                                        và có thể mặc quanh năm.</p>
                                </div>
                            </div>
                        </div>


                        <div class="tab-pane" id="tabs-7" role="tabpanel">
                            <div class="product_details_tab_content">
                                <p class="note">Khoảng thời gian này chỉ mang tính tạm thời, nhưng lại tạo
                                    nên một bố cục hài hòa và chắc chắn, không đòi hỏi quá nhiều.
                                    Pellentesque diam dolor, một yếu tố giúp tăng sự liên kết và mềm mại cho
                                    bố cục. Phần nội dung này hỗ trợ tốt cho cấu trúc tổng thể, mang lại sự
                                    ổn định và tăng tính trực quan cho người dùng.</p>
                                <div class="product_details_tab_content_item">
                                    <h5>THÔNG TIN SẢN PHẨM</h5>
                                    <p>Pocket PC là một dạng máy tính cầm tay, sở hữu nhiều tính năng tương
                                        tự như một máy tính cá nhân hiện đại. Những thiết bị nhỏ gọn này cho
                                        phép người dùng nhận và lưu trữ email, tạo danh bạ liên hệ, sắp xếp
                                        các cuộc hẹn, lướt Internet, gửi tin nhắn văn bản và nhiều chức năng
                                        khác. Mỗi sản phẩm được gắn nhãn Pocket PC đều phải đi kèm phần mềm
                                        chuyên dụng để vận hành thiết bị và phải có màn hình cảm ứng cùng
                                        touchpad.</p>
                                    <p>Giống như nhiều sản phẩm công nghệ mới khác, giá của Pocket PC khi
                                        mới ra mắt khá cao. Khoảng năm 2003, người tiêu dùng phải bỏ ra gần
                                        700 USD để sở hữu một trong những mẫu Pocket PC cao cấp nhất. Ngày
                                        nay, khi độ “mới lạ” đã giảm, khách hàng nhận thấy mức giá đã trở
                                        nên hợp lý hơn nhiều. Hiện tại, với khoảng 350 USD, bạn đã có thể
                                        mua một chiếc Pocket PC hoàn toàn mới.</p>
                                </div>
                                <div class="product_details_tab_content_item">
                                    <h5>CHẤT LIỆU SỬ DỤNG</h5>
                                    <p>Polyester được xem là chất liệu có chất lượng thấp hơn vì không phải
                                        là sợi tự nhiên. Nó được tạo ra từ các sợi tổng hợp, khác với những
                                        chất liệu tự nhiên như len. Những bộ suit làm từ polyester dễ bị
                                        nhăn và được biết đến là không thoáng khí. Ngoài ra, suit polyester
                                        thường có độ bóng nhẹ so với suit làm từ len hoặc cotton, điều này
                                        có thể khiến bộ trang phục trông kém sang trọng.

                                        Ngược lại, chất liệu nhung (velvet) có kết cấu mềm mịn, sang trọng
                                        và thoáng khí. Velvet là lựa chọn tuyệt vời cho áo khoác dự tiệc tối
                                        và có thể được sử dụng quanh năm.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    <div class="reviews">
        <h2>ĐÁNH GIÁ SẢN PHẨM</h2>
        <div class="review-container">
            <!-- Khối bên trái: Đánh giá của người dùng -->
            <div class="left-block">
                <div class="item">
                    <!-- Phần đánh giá bên trái -->
                    <div class="review-content">
                        <div class="item_top">
                            <div class="user">
                                <img src="../../images/image_product/user.png">

                                <div class="infos">
                                    <p><span class="reviews">T***h</span></p>
                                    <p><span class="time">2025-20-11</span></p>
                                </div>
                            </div>
                        </div>

                        <!-- Bao quanh item_mid và item_content để xếp ngang -->
                        <div class="review-details">
                            <div class="item_mid">
                                <div class="rating">
                                    <img src="../../images/image_product/start.png">
                                    <img src="../../images/image_product/start.png">
                                    <img src="../../images/image_product/start.png">
                                    <img src="../../images/image_product/start.png">
                                    <img src="../../images/image_product/start.png">
                                </div>
                            </div>
                            <div class="item_content">
                                <div class="item-content-main-content  ">
                                    <div class="item-content-main-content-skuInfo">
                                        <div class="skuInfo-item"><span class="skuInfo-label">Màu:&nbsp;</span><span
                                                class="skuInfo-value">Xanh</span></div>
                                        <div class="skuInfo-item"><span
                                                class="skuInfo-label">Size:&nbsp;</span><span
                                                class="skuInfo-value">L </span></div>
                                    </div>
                                    <div class="item-content-main-content-reviews">
                                        <div class="item-content-main-content-reviews-item"><span>Áo đẹp, mặc mát,
                                                    tôn dáng nha mn, cũng ít chỉ thừa, với giá này thì ok lắm</span>
                                        </div>
                                        <div class="item-content-main-content-reviews-item"><span
                                                class="review-attribute">Chất liệu: </span><span>chất dày vải
                                                    đẹp.</span>
                                        </div>
                                        <div class="item-content-main-content-reviews-item"><span
                                                class="review-attribute">🎨Design:</span><span>rất sang trọng</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Phần ảnh bên phải -->
                    <div class="right-block">

                        <img src="../../images/image_product/anh1.1.png" alt="Ảnh khối bên phải">
                        <img src="../../images/image_product/anh1.1.2.png" alt="Ảnh khối bên phải">
                    </div>
                </div>
            </div>

            <div class="item">
                <!-- Phần đánh giá bên trái -->
                <div class="review-content">
                    <div class="item_top">
                        <div class="user">
                            <img src="../../images/image_product/user.png">
                            <div class="infos">
                                <p><span class="reviews">H***h</span></p>
                                <p><span class="time">2025-21-11</span></p>
                            </div>
                        </div>
                    </div>

                    <!-- Bao quanh item_mid và item_content để xếp ngang -->
                    <div class="review-details">
                        <div class="item_mid">
                            <div class="rating">
                                <img src="../../images/image_product/start.png">
                                <img src="../../images/image_product/start.png">
                                <img src="../../images/image_product/start.png">
                                <img src="../../images/image_product/start.png">

                            </div>
                        </div>
                        <div class="item_content">
                            <div class="item-content-main-content  ">
                                <div class="item-content-main-content-skuInfo">
                                    <div class="skuInfo-item"><span class="skuInfo-label">Màu:&nbsp;</span><span
                                            class="skuInfo-value">Đỏ</span></div>
                                    <div class="skuInfo-item"><span class="skuInfo-label">Size:&nbsp;</span><span
                                            class="skuInfo-value">XL</span></div>
                                </div>
                                <div class="item-content-main-content-reviews">
                                    <div class="item-content-main-content-reviews-item"><span>Shop giao hàng nhanh,
                                                đón gói cẩn thận, chất liệu áo mềm mịn sờ mát tay, màu áo rất đẹp</span>
                                    </div>
                                    <div class="item-content-main-content-reviews-item"><span
                                            class="review-attribute">Chất liệu: </span><span>chất dày vải
                                                đẹp.</span>
                                    </div>
                                    <div class="item-content-main-content-reviews-item"><span
                                            class="review-attribute">🎨Design:</span><span>rất sang trọng</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Phần ảnh bên phải -->
                <div class="right-block">

                    <img src="../../images/image_product/anh_polo1.png" alt="Ảnh khối bên phải">
                    <img src="../../images/image_product/anh_polo2.png" alt="Ảnh khối bên phải">
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>

    <div class="re">
        <div class="related">
            <div class="container">
                <div class="row">
                    <div class="col_top">
                        <h3 class="related-title">SẢN PHẨM NỔI BẬT</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col_1">
                        <div class="product_item">
                            <div class="product_item_pic1">

                                <img src="../../images/image_product/anh1.png">
                            </div>
                            <div class="product_item_text">
                                <h6>Áo polo nam tay ngắn sọc phối patch.Fitted</h6>

                                <h5>1.690.000đ</h5>
                                <button class="add-to-cart-btn" onclick="location.href='cart.html'">Thêm vào giỏ
                                    hàng
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col_2">
                        <div class="product_item">
                            <div class="product_item_pic2">
                                <img src="../../images/image_product/anh1.3.png">
                            </div>
                            <div class="product_item_text">
                                <h6>Quần jeans nam natural form tapered dáng suông </h6>
                                <h5>1.510.000đ</h5>

                                <button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>
                    <div class="col_3">
                        <div class="product_item sale">
                            <div class="product_item_pic3">
                                <img src="../../images/image_product/anh1.2.png">
                                <span class="label">Sale</span>
                            </div>
                            <div class="product_item_text">
                                <h6>Áo Sơ Mi Nam Tay Dài Chất Liệu BAMBOO Cao Cấp</h6>
                                <h5>890.000đ</h5>

                                <button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>
                    <div class="col_4">
                        <div class="product_item">
                            <div class="product_item_pic4">
                                <img src="../../images/image_product/anh1.4.png">
                            </div>
                            <div class="product_item_text">
                                <h6>Quần Short Kaki Nam Cotton Spandex Form Straight</h6>
                                <h5>879.000đ</h5>

                                <button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
<script src="../../js/product_detail.js"></script>
</body>

</html>