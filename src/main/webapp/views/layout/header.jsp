    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <header class="site-header">
        <div class="header-container">
        <div class="header-main-row">
        <div class="header-left-section">
        <button class="mobile-menu-toggle" aria-label="Open menu" onclick="toggleMobileMenu()">
        <i class="fas fa-bars"></i>
        </button>
        </div>

        <div class="brand-logo">
        <a href="${root}/views/pages/index.jsp" aria-label="home">
        <img src="${root}/images/logo.png" alt="StyleEra"/>
        </a>
        </div>

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
        <a class="nav-link-primary" href="${root}/views/pages/index.jsp">TRANG CHỦ</a>
        </li>

        <li class="nav-item">
        <a class="nav-link-primary" href="${root}/ProductController">NAM</a>
        <div class="submenu-container">
        <div class="submenu-column">
        <a href="${root}/views/pages/product.jsp" class="submenu-title">ÁO NAM</a>
        <ul class="submenu-items">
        <li><a href="${root}/views/pages/product.jsp">Áo Khoác Nam</a></li>
        <li><a href="${root}/views/pages/product.jsp">Áo Thun</a></li>
        <li><a href="${root}/views/pages/product.jsp">Áo Polo</a></li>
        <li><a href="${root}/views/pages/product.jsp">Áo Sơ Mi</a></li>
        </ul>
        </div>
        <div class="submenu-column">
        <a href="${root}/views/pages/product.jsp" class="submenu-title">QUẦN NAM</a>
        <ul class="submenu-items">
        <li><a href="${root}/views/pages/product.jsp">Quần ngắn</a></li>
        <li><a href="${root}/views/pages/product.jsp">Quần dài</a></li>
        <li><a href="${root}/views/pages/product.jsp">Quần Jean</a></li>
        </ul>
        </div>
        </div>
        </li>

        <li class="nav-item">
        <a class="nav-link-primary" href="${root}/ProductController">NỮ</a>
        <div class="submenu-container">
        <div class="submenu-column">
        <a href="${root}/views/pages/product.jsp" class="submenu-title">ÁO NỮ</a>
        <ul class="submenu-items">
        <li><a href="${root}/views/pages/product.jsp">Áo Khoác</a></li>
        <li><a href="${root}/views/pages/product.jsp">Áo Thun</a></li>
        <li><a href="${root}/views/pages/product.jsp">Áo Polo</a></li>
        <li><a href="${root}/views/pages/product.jsp">Áo Sơ Mi</a></li>
        </ul>
        </div>
        <div class="submenu-column">
        <a href="${root}/views/pages/product.jsp" class="submenu-title">QUẦN / VÁY NỮ</a>
        <ul class="submenu-items">
        <li><a href="${root}/views/pages/product.jsp">Váy</a></li>
        <li><a href="${root}/views/pages/product.jsp">Đầm</a></li>
        <li><a href="${root}/views/pages/product.jsp">Quần ngắn</a></li>
        <li><a href="${root}/views/pages/product.jsp">Quần dài</a></li>
        </ul>
        </div>
        </div>
        </li>

        <li class="nav-item">
        <a class="nav-link-primary" href="${root}/ProductController">Đồ đôi</a>
        <div class="submenu-container">
        <ul class="submenu-items">
        <li><a href="${root}/views/pages/product.jsp">Áo khoác đôi</a></li>
        <li><a href="${root}/views/pages/product.jsp">Áo thun đôi</a></li>
        <li><a href="${root}/views/pages/product.jsp">Đồ bộ đôi</a></li>
        </ul>
        </div>
        </li>

        <li class="nav-item">
        <a class="nav-link-primary" href="${root}/views/pages/contact.jsp">LIÊN HỆ</a>
        </li>
        </ul>
        </nav>

        <div class="header-right-section">
        <div class="search-form-wrapper" id="searchForm">
        <form action="${root}/search" class="search-input-group">
        <input type="hidden" name="type" value="product"/>
        <button class="search-submit-btn" type="submit" aria-label="Search">
        <i class="fas fa-search"></i>
        </button>
        <input name="q" maxlength="40" autocomplete="off" class="search-input-field" type="text"
        placeholder="Tìm kiếm..." aria-label="Search">
        </form>
        </div>

        <a href="${root}/admin/admin-login.jsp" class="admin-link" title="Quản trị viên">
        <i class="fas fa-user-cog" style="color: black;"></i>
        </a>

        <div class="account-dropdown-wrapper">
        <a href="${root}/views/pages/login.jsp" class="account-link" title="Khách hàng">
        <i class="fa fa-user"></i>
        </a>
        <ul class="account-dropdown-menu">
        <li><a href="${root}/views/pages/account.jsp">Tài khoản của tôi</a></li>
        <li><a href="#">Đăng xuất</a></li>
        </ul>
        </div>

        <a class="cart-link" href="${root}/views/pages/cart.jsp">
        <i class="fas fa-shopping-bag"></i>
        <span class="cart-badge">0</span>
        </a>
        </div>
        </div>
        </div>
        </header>