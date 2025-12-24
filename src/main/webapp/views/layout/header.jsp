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
        <a href="${root}/home" aria-label="home">
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
        <a class="nav-link-primary" href="${root}/home" style=" color: #000; font-weight: 500;">TRANG CHỦ</a>
        </li>

        <c:forEach items="${parents}" var="p">
            <li class="nav-item">
            <%-- SỬA LỖI: Trỏ về Servlet /product thay vì file .jsp --%>
            <a class="nav-link-primary" href="${root}/product?parentId=${p.id}">
            ${p.name.toUpperCase()}
            </a>

            <c:if test="${not empty p.subCategories}">
                <div class="submenu-container">
                <c:choose>
                    <%-- TRƯỜNG HỢP 1: ĐỒ ĐÔI --%>
                    <c:when test="${p.name == 'Đồ Đôi'}">
                        <div class="submenu-column">
                        <ul class="submenu-items">
                        <c:forEach items="${p.subCategories}" var="s">
                            <li>
                            <%-- SỬA LỖI: Trỏ về Servlet /product --%>
                            <a href="${root}/product?cateId=${s.id}">${s.name}</a>
                            </li>
                        </c:forEach>
                        </ul>
                        </div>
                    </c:when>

                    <%-- TRƯỜNG HỢP 2: NAM / NỮ --%>
                    <c:otherwise>
                        <div class="submenu-column">
                        <%-- Link tiêu đề cột Áo: Tạm thời trỏ về Parent --%>
                        <a href="${root}/product?parentId=${p.id}" class="submenu-title">
                        ÁO ${p.name.toUpperCase()}
                        </a>
                        <ul class="submenu-items">
                        <c:forEach items="${p.subCategories}" var="s">
                            <c:if test="${s.name.contains('Áo')}">
                                <li>
                                <%-- SỬA LỖI: Trỏ về Servlet /product --%>
                                <a href="${root}/product?cateId=${s.id}">${s.name}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        </ul>
                        </div>

                        <div class="submenu-column">
                        <%-- Link tiêu đề cột Quần: Tạm thời trỏ về Parent --%>
                        <a href="${root}/product?parentId=${p.id}" class="submenu-title">
                        <c:choose>
                            <c:when test="${p.name == 'Nữ'}">QUẦN / VÁY NỮ</c:when>
                            <c:otherwise>QUẦN ${p.name.toUpperCase()}</c:otherwise>
                        </c:choose>
                        </a>
                        <ul class="submenu-items">
                        <c:forEach items="${p.subCategories}" var="s">
                            <c:if test="${!s.name.contains('Áo')}">
                                <li>
                                <%-- SỬA LỖI: Trỏ về Servlet /product --%>
                                <a href="${root}/product?cateId=${s.id}">${s.name}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
                </div>
            </c:if>
            </li>
        </c:forEach>

        <li class="nav-item">
        <a class="nav-link-primary" href="${root}/views/pages/contact.jsp" style=" color: #000; font-weight: 500;">LIÊN HỆ</a>
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