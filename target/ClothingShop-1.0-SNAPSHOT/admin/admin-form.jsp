<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>StyleEra - Thêm/Chỉnh Sửa Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="css/admin.css"/>
</head>

<body>
<div class="admin-container">
    <!-- ===== SIDEBAR ===== -->
    <aside class="admin-sidebar">
        <div class="sidebar-header">
            <div class="brand-logo">
                <i class="fas fa-tshirt" style="font-size: 28px"></i>
            </div>
            <h2 class="brand-name">Admin</h2>
        </div>

        <nav class="sidebar-menu">
            <div class="menu-label">MENU</div>
            <ul class="menu-list">
                <li class="menu-item">
                    <a href="admin-dashboard.jsp" class="menu-link">
                        <i class="fas fa-chart-line"></i>
                        <span>Bảng Điều Khiển</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="admin-products.jsp" class="menu-link active">
                        <i class="fas fa-box"></i>
                        <span>Sản Phẩm</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="admin-orders.jsp" class="menu-link">
                        <i class="fas fa-shopping-cart"></i>
                        <span>Đơn Hàng</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="admin-profile.jsp" class="menu-link">
                        <i class="fa-solid fa-user"></i>

                        <span>Quản Trị Viên</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="admin-customer-edit.jsp" class="menu-link">
                        <i class="fas fa-users"></i>
                        <span> Người Dùng</span>
                    </a>
                </li>
            </ul>
        </nav>

        <div class="sidebar-footer">
            <button class="btn-logout" onclick="logout()">
                <i class="fas fa-sign-out-alt"></i>
                <span>Đăng Xuất</span>
            </button>
        </div>
    </aside>

    <!-- ===== MAIN CONTENT ===== -->
    <div class="admin-main">
        <!-- ===== HEADER ===== -->
        <header class="admin-header">
            <div class="header-left">
                <button class="icon-btn d-lg-none" id="sidebarToggle">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="header-search">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" placeholder=" Tìm kiếm..."/>
                    </div>
                </div>
            </div>

            <div class="header-right">
                <div class="header-icons">
                    <button class="icon-btn" title="Notifications">
                        <i class="fas fa-bell"></i>
                        <span class="notification-badge">3</span>
                    </button>
                </div>

                <div class="admin-profile">
                    <img src="images/logoadm.png" alt="Admin" class="profile-img"/>
                    <div class="profile-info">
                        <div class="profile-name">Quản Trị Viên</div>
                        <div class="profile-role">Admin</div>
                    </div>
                    <button class="icon-btn profile-dropdown" type="button" data-bs-toggle="dropdown">
                        <i class="fas fa-chevron-down"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li>
                            <a class="dropdown-item" href="admin-profile.jsp">Hồ Sơ</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="admin-profile.jsp">Cài Đặt</a>
                        </li>
                        <li>
                            <hr class="dropdown-divider"/>
                        </li>
                        <li>
                            <a class="dropdown-item" href="admin-login.jsp">Đăng Xuất</a>
                        </li>
                    </ul>
                </div>
            </div>
        </header>

        <!-- ===== CONTENT ===== -->
        <main class="admin-content">
            <!-- Page Header -->
            <div class="page-header mb-5">
                <div>
                    <h1 class="page-title" id="pageTitle">Thêm Sản Phẩm Mới</h1>
                </div>
                <div class="page-actions">
                    <a href="admin-products.jsp" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left"></i> Quay Lại
                    </a>
                </div>
            </div>

            <div class="row">
                <!-- Left Column - Form -->
                <div class="col-lg-8">
                    <form id="productForm" class="needs-validation" novalidate>
                        <!-- Basic Information -->
                        <div class="card shadow-sm mb-4">
                            <div class="card-header bg-light border-bottom">
                                <h6 class="mb-0">Thông Tin Cơ Bản</h6>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Tên Sản Phẩm</label>
                                    <input type="text" class="form-control" placeholder="Nhập tên sản phẩm" required/>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Phân Loại</label>
                                        <select class="form-select" required>
                                            <option value="">-- Chọn Thể Loại --</option>
                                            <option value="1">Nam</option>
                                            <option value="2">Nữ</option>
                                            <option value="3">Đồ Đôi</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Danh Mục</label>
                                        <select class="form-select" required>
                                            <option value="">-- Chọn Danh Mục --</option>
                                            <option value="nam">Áo Thun Nam</option>
                                            <option value="nam">Áo Polo Nam</option>
                                            <option value="nam">Áo Khoác Nam</option>
                                            <option value="nam">Quần Jean Nam</option>
                                            <option value="nam">Quần Ngắn Nam</option>
                                            <option value="nam">Áo Thun Nữ</option>
                                            <option value="nam">Áo Polo Nữ</option>
                                            <option value="nu">Áo Khoác Nữ</option>
                                            <option value="nu">Váy Nữ</option>
                                            <option value="nu">Đầm Nữ</option>
                                            <option value="nu">Quần dài Nữ</option>
                                            <option value="nu">Quần ngắn Nữ</option>
                                            <option value="doi">Áo khoác đôi</option>
                                            <option value="doi">Áo thun đôi</option>
                                            <option value="doi">Đồ bộ Đôi</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-bold">Mô Tả Sản Phẩm</label>
                                    <textarea
                                            class="form-control"
                                            rows="4"
                                            placeholder="Nhập mô tả chi tiết sản phẩm"
                                            required
                                    ></textarea>
                                </div>
                            </div>
                        </div>

                        <!-- Pricing & Inventory -->
                        <div class="card shadow-sm mb-4">
                            <div class="card-header bg-light border-bottom">
                                <h6 class="mb-0">Giá & Kho Hàng</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Giá Bán (đ)</label>
                                        <input type="number" class="form-control" placeholder="0" min="0" required/>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Số Lượng Kho</label>
                                        <input type="number" class="form-control" placeholder="0" min="0" required/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Trạng Thái</label>
                                        <select class="form-select" required>
                                            <option value="1">Hoạt Động</option>
                                            <option value="0">Hết Hàng</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4">
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-light border-bottom">
                            <h6 class="mb-0">Ảnh Sản Phẩm</h6>
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Chọn Ảnh</label>
                                <input type="file" class="form-control" id="productImages" accept="image/*" multiple required/>
                                <div class="form-text">
                                    Chọn 1 hoặc nhiều ảnh (JPG, PNG)
                                </div>
                                <div id="imgPreview" class="d-flex flex-column gap-2 mt-3"></div>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex gap-2">
                        <button type="submit" form="productForm" class="btn btn-primary btn-lg flex-grow-1">
                            <i class="fas fa-save"></i> Thêm Sản Phẩm
                        </button>
                        <a href="admin-products.jsp" class="btn btn-outline-secondary btn-lg flex-grow-1">
                            <i class="fas fa-times"></i> Hủy
                        </a>
                    </div>
                </div>
            </div>
        </main>
        <footer class="bg-dark text-white py-3">
            <div class="container-fluid text-center">
                <p class="mb-0">&copy; 2025 StyleEra Admin. All rights reserved.</p>
            </div>
        </footer>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom JS -->
<script src="js/admin-common.js"></script>
<script src="js/admin-dashboard.js"></script>
<script src="js/admin_Form.js"></script>
</body>
</html>
