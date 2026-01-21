<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>StyleEra - Bảng Điều Khiển Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="css/admin.css"/>
</head>
<body>

<!-- ===== HEADER ===== -->
<c:set var="currentPage" value="dashboard" scope="request"/>

    <%@ include file="/admin/layout/Headeradmin.jsp" %>


    <!-- ===== CONTENT ===== -->
        <main class="admin-content">
            <!-- Page Header -->
            <div class="page-header mb-5">
                <div>
                    <h1 class="page-title">Bảng Điều Khiển</h1>
                </div>
            </div>

            <!-- Stat Cards -->
            <div class="row mb-5 g-4">
                <!-- Customers -->
                <div class="col-md-6 col-lg-3">
                    <div class="card stat-card shadow-sm h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center justify-content-between mb-3">
                                <div>
                                    <p class="text-muted small mb-1">Người dùng</p>
                                    <h3 class="mb-0">3,782</h3>
                                </div>
                                <div class="stat-icon bg-primary text-white rounded-circle p-3">
                                    <i class="fas fa-users fa-lg"></i>
                                </div>
                            </div>
                            <small class="text-success">
                                <i class="fas fa-arrow-up"></i> 11.01% từ tháng trước
                            </small>
                        </div>
                    </div>
                </div>

                <!-- Orders -->
                <div class="col-md-6 col-lg-3">
                    <div class="card stat-card shadow-sm h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center justify-content-between mb-3">
                                <div>
                                    <p class="text-muted small mb-1">Đơn Hàng</p>
                                    <h3 class="mb-0">3,000</h3>
                                </div>
                                <div class="stat-icon bg-success text-white rounded-circle p-3">
                                    <i class="fas fa-shopping-cart fa-lg"></i>
                                </div>
                            </div>
                            <small class="text-danger">
                                <i class="fas fa-arrow-down"></i> 9.05% từ tháng trước
                            </small>
                        </div>
                    </div>
                </div>

                <!-- Revenue -->
                <div class="col-md-6 col-lg-3">
                    <div class="card stat-card shadow-sm h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center justify-content-between mb-3">
                                <div>
                                    <p class="text-muted small mb-1">Doanh Thu</p>
                                    <h3 class="mb-0">$45M</h3>
                                </div>
                                <div class="stat-icon bg-warning text-white rounded-circle p-3">
                                    <i class="fas fa-dollar-sign fa-lg"></i>
                                </div>
                            </div>
                            <small class="text-success">
                                <i class="fas fa-arrow-up"></i> 8.5% từ tháng trước
                            </small>
                        </div>
                    </div>
                </div>

                <!-- Products -->
                <div class="col-md-6 col-lg-3">
                    <div class="card stat-card shadow-sm h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center justify-content-between mb-3">
                                <div>
                                    <p class="text-muted small mb-1">Sản Phẩm</p>
                                    <h3 class="mb-0">1,000</h3>
                                </div>
                                <div class="stat-icon bg-danger text-white rounded-circle p-3">
                                    <i class="fas fa-box fa-lg"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4 mb-5">
                <!-- Revenue Chart -->
                <div class="col-lg-8 col-md-12">
                    <div class="card shadow-sm h-100">
                        <div class="card-header bg-light border-bottom">
                            <h6 class="mb-0">Doanh Thu Theo Tháng</h6>
                        </div>
                        <div class="card-body p-3">
                            <div class="chart-container">
                                <canvas id="revenueChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Category -->
                <div class="col-lg-4 col-md-12">
                    <div class="card shadow-sm h-100">
                        <div class="card-header bg-light border-bottom">
                            <h6 class="mb-0">Danh Mục Bán Chạy</h6>
                        </div>
                        <div class="card-body">
                            <div class="category-list">
                                <div class="category-item">
                                    <span>Nam</span>
                                    <span class="badge bg-primary">45%</span>
                                </div>
                                <div class="category-item">
                                    <span>Nữ</span>
                                    <span class="badge bg-success">35%</span>
                                </div>
                                <div class="category-item">
                                    <span>Đồ Đôi</span>
                                    <span class="badge bg-warning">20%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-4">
                <!-- Recent Orders -->
                <div class="col-lg-8">
                    <div class="card shadow-sm">
                        <div class="card-header bg-light border-bottom d-flex justify-content-between align-items-center">
                            <h6 class="mb-0">Đơn Hàng Gần Đây</h6>
                            <a href="admin-orders.jsp" class="btn btn-sm btn-primary">Xem tất cả</a>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0">
                                    <thead class="table-light">
                                    <tr>
                                        <th>Mã ĐH</th>
                                        <th>Khách Hàng</th>
                                        <th>Ngày Đặt</th>
                                        <th>Tổng Tiền</th>
                                        <th>Trạng Thái</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>#985106</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>14/11/2025</td>
                                        <td>500,000đ</td>
                                        <td>
                                            <span class="badge bg-info">Chờ Vận Chuyển</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#985105</td>
                                        <td>Trần Thị B</td>
                                        <td>13/11/2025</td>
                                        <td>750,000đ</td>
                                        <td>
                                            <span class="badge bg-warning text-dark">Đang Vận Chuyển</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#985104</td>
                                        <td>Lê Văn C</td>
                                        <td>12/11/2025</td>
                                        <td>1,200,000đ</td>
                                        <td><span class="badge bg-success">Đã Giao</span></td>
                                    </tr>
                                    <tr>
                                        <td>#985103</td>
                                        <td>Phạm Văn D</td>
                                        <td>11/11/2025</td>
                                        <td>890,000đ</td>
                                        <td><span class="badge bg-danger">Đã Hủy</span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Top Products -->
                <div class="col-lg-4">
                    <div class="card shadow-sm">
                        <div class="card-header bg-light border-bottom">
                            <h6 class="mb-0">Top 5 Sản Phẩm Bán Chạy</h6>
                        </div>
                        <div class="card-body p-0">
                            <ol class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center text-bg-light">
                                    <span><strong>1.</strong> Áo Khoác Nam</span>
                                    <div class="product-img-wrapper me-3">
                                        <img src="../images/product_item_nam/1/1.1/aokhoac_nam.avif" alt="Áo Khoác Nam" class="product-img"/>
                                    </div>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center text-bg-light">
                                    <span><strong>2.</strong> Đầm Nữ</span>
                                    <div class="product-img-wrapper me-3">
                                        <img src="../images/product_item_women/6/6-1/trangphuc.png" alt="Đầm Nữ" class="product-img"/>
                                    </div>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center text-bg-light">
                                    <span><strong>3.</strong> Quần dài Nữ</span>
                                    <div class="product-img-wrapper me-3">
                                        <img src="../images/product_item_women/8/8-1/trangphuc.png" alt="Quần dài Nữ" class="product-img"/>
                                    </div>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center text-bg-light">
                                    <span><strong>4.</strong> Áo Sơ Mi nữ</span>
                                    <div class="product-img-wrapper me-3">
                                        <img src="../images/product_item_women/4/4-6/trangphuc.png" alt="Áo Sơ Mi nữ" class="product-img"/>
                                    </div>
                                </li>

                                <li class="list-group-item d-flex justify-content-between align-items-center text-bg-light">
                                    <span><strong>5.</strong> Váy nữ</span>
                                    <div class="product-img-wrapper me-3">
                                        <img src="../images/product_item_women/5/5-6/trangphuc.png" alt="Váy nữ" class="product-img"/>
                                    </div>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<!-- ===== FOOTER ===== -->
<%@ include file="/admin/layout/Footeradmin.jsp" %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>

<!-- Custom JS -->
<script src="js/admin-common.js"></script>
<script src="js/admin-dashboard.js"></script>
</body>
</html>
