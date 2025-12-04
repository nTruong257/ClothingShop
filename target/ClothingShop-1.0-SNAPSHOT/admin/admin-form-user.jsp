<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>StyleEra - Người Dùng</title>
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
                    <a href="admin-products.jsp" class="menu-link">
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
                    <a href="admin-customer-edit.jsp" class="menu-link active">
                        <i class="fas fa-users"></i>
                        <span>Người dùng</span>
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
                    <h1 class="page-title" id="pageTitle">Thêm Tài Khoản</h1>
                </div>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="adminProfile">
                    <div class="row">
                        <!-- Left Column - Form -->
                        <div class="col-lg-8">
                            <form id="customerForm" class="needs-validation" novalidate>
                                <div class="card shadow-sm mb-4">
                                    <div class="card-header bg-light border-bottom">
                                        <h6 class="mb-0">Thông Tin Cá Nhân</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label fw-bold">Họ Tên</label>
                                                <input type="text" class="form-control" placeholder="Nhập họ tên" required/>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label fw-bold">Số Điện Thoại</label>
                                                <input type="tel" class="form-control" placeholder="Nhập số điện thoại" required/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label fw-bold">Email</label>
                                                <input type="email" class="form-control" placeholder="Nhập email" required/>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card shadow-sm mb-4">
                                    <div class="card-header bg-light border-bottom">
                                        <h6 class="mb-0">Địa Chỉ</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label class="form-label fw-bold"
                                            >Địa Chỉ Người Dùng</label
                                            >
                                            <input type="text" class="form-control" placeholder="Nhập địa chỉ" required/>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-8 mb-3">
                                                <label class="form-label fw-bold"
                                                >Tỉnh/Thành Phố</label
                                                >
                                                <input type="text" class="form-control" placeholder="Tỉnh/Thành phố" required/>
                                            </div>
                                            <div class="col-md-8 mb-3">
                                                <label class="form-label fw-bold">Quận/Huyện</label>
                                                <input type="text" class="form-control" placeholder="Quận/Huyện" required/>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Thông Tin Tài Khoản -->
                                <div class="card shadow-sm mb-4">
                                    <div class="card-header bg-light border-bottom">
                                        <h6 class="mb-0">Thông Tin Tài Khoản</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="row"></div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label fw-bold">Ngày Tạo</label>
                                                <input type="date" class="form-control" required/>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label fw-bold">Ghi Chú</label>
                                            <textarea class="form-control" rows="3" placeholder="Thêm ghi chú"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <!-- Cập Nhật Mật Khẩu -->
                                <div class="card shadow-sm mb-4">
                                    <div class="card-header bg-light border-bottom">
                                        <h6 class="mb-0">Cập Nhật Mật Khẩu</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label class="form-label fw-bold">Mật Khẩu Hiện Tại</label>
                                            <input type="password" class="form-control" placeholder="Nhập mật khẩu hiện tại"/>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label fw-bold">Mật Khẩu Mới</label>
                                            <input type="password" class="form-control" id="newPassword" placeholder="Nhập mật khẩu mới"/>
                                            <small class="form-text text-muted">Mật khẩu phải có ít nhất 8 ký tự</small>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label fw-bold">Xác Nhận Mật Khẩu</label>
                                            <input type="password" class="form-control" id="confirmPassword" placeholder="Xác nhận mật khẩu mới"/>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!-- Right Column - Actions & Info -->
                        <div class="col-lg-4">
                            <!-- Action Buttons -->
                            <div class="d-flex gap-2">
                                <button type="submit" form="customerForm" class="btn btn-primary btn-lg flex-grow-1">
                                    <i class="fas fa-save"></i> Cập Nhật
                                </button>
                                <a href="admin-customer-edit.jsp" class="btn btn-outline-secondary btn-lg flex-grow-1">
                                    <i class="fas fa-times"></i> Hủy
                                </a>
                            </div>
                        </div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom JS -->
<script src="js/admin-common.js"></script>
<script src="js/admin_customer.js"></script>
<script src="js/admin_Form_user.js"></script>
</body>
</html>
