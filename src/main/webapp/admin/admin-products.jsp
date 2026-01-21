<%@ page import="com.clothingshop.styleera.model.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=d  evice-width, initial-scale=1.0"/>
    <title>StyleEra - Quản Lý Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="${root}/admin/css/admin.css"/>
</head>

<body>
<c:set var="currentPage" value="products" scope="request"/>
<!-- ===== HEADER ===== -->
<%@ include file="/admin/layout/Layoutadmin.jsp" %>
        <!-- ===== CONTENT ===== -->
        <main class="admin-content">
            <!-- Page Header -->
            <div class="page-header mb-5">
                <div>
                    <h1 class="page-title">Quản Lý Sản Phẩm</h1>
                </div>
                <div class="page-actions">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">
                        <i class="fas fa-plus"></i> Thêm Sản Phẩm
                    </button>
                </div>
            </div>

            <!-- Filters & Search -->
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <div class="row g-3 align-items-end">
                        <div class="col-md-4">
                            <label class="form-label">Tìm Kiếm</label>
                            <input type="text" class="form-control" id="searchInput" placeholder="Tên sản phẩm..."/>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Phân Loại</label>
                            <select class="form-select categoryFilter">
                                <option value="">Danh Mục</option>
                                <option value="nam">Nam</option>
                                <option value="nu">Nữ</option>
                                <option value="doi">Đồ Đôi</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Phân Loại</label>
                            <select class="form-select categoryFilter">
                                <option value="">Tất Cả Danh Mục</option>
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
                        <div class="col-md-2">
                            <label class="form-label">Trạng Thái</label>
                            <select class="form-select" id="statusFilter">
                                <option value="">Tất Cả Trạng Thái</option>
                                <option value="active">Hoạt Động</option>
                                <option value="outofstock">Hết Hàng</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Products Table -->
            <div class="card shadow-sm">
                <div class="card-header bg-light border-bottom d-flex justify-content-between align-items-center">
                    <h6 class="mb-0">Danh Sách Sản Phẩm</h6>
                    <span class="text-muted small">Tổng cộng: <strong>${productsAdmin.size()}</strong> sản phẩm</span>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0" id="productsTable">
                            <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Ảnh Sản Phẩm</th>
                                <th style="min-width: 250px">Tên Sản Phẩm</th>
                                <th>Danh Mục</th>
                                <th>Phân Loại</th>
                                <th>Size</th>
                                <th>Màu Sắc</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Trạng Thái</th>
                                <th style="width: 150px">Hành Động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${productsAdmin == null || productsAdmin.size() == 0}">
                                    <tr>
                                        <td colspan="11" class="text-center py-4">
                                            <i class="fas fa-inbox" style="font-size: 48px; color: #ccc;"></i>
                                            <p class="mt-2 text-muted">Hiện chưa có sản phẩm nào</p>
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${productsAdmin}" var="p">
                                        <tr>
                                            <td>#${p.product_id}</td>
                                            <td>
                                                <div class="product-img-wrapper">
                                                    <c:if test="${not empty p.thumbnail}">
                                                        <img src="${pageContext.request.contextPath}${p.thumbnail}"
                                                             alt="${p.product_name}" width="60" height="60"
                                                             style="object-fit: cover; border-radius: 4px">
                                                    </c:if>
                                                    <c:if test="${empty p.thumbnail}">
                                                        <img src="https://via.placeholder.com/60" alt="No image" width="60" height="60">
                                                    </c:if>
                                                </div>
                                            </td>
                                            <td><strong>${p.product_name}</strong></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${p.subcategories.category.name eq 'Nam'}">
                                                        <span class="badge bg-primary">${p.subcategories.category.name}</span>
                                                    </c:when>
                                                    <c:when test="${p.subcategories.category.name eq 'Nữ'}">
                                                        <span class="badge bg-danger">${p.subcategories.category.name}</span>
                                                    </c:when>
                                                    <c:when test="${p.subcategories.category.name eq 'Đồ Đôi'}">
                                                        <span class="badge bg-dark">${p.subcategories.category.name}</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td><span>${p.subcategories.name}</span></td>
                                            <td>
                                                <c:if test="${not empty p.variants}">
                                                    <c:forEach items="${p.variants}" var="v">
                                                        <span class="badge text-dark">${v.size}</span>
                                                    </c:forEach>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${not empty p.variants}">
                                                    <c:forEach items="${p.variants}" var="v">
                                                        <span class="badge text-dark">${v.color}</span>
                                                    </c:forEach>
                                                </c:if>
                                            </td>
                                            <td><strong><fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫"/></strong></td>
                                            <td><span class="badge bg-success">Có sẵn</span></td>
                                            <td><span class="badge bg-success">Hoạt Động</span></td>
                                            <td>
                                                <a href="${root}/admin-form?id=${p.product_id}" class="btn btn-sm btn-warning" title="Chỉnh sửa">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <button class="btn btn-sm btn-danger" title="Xóa">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Pagination -->
                <div class="card-footer bg-light">
                    <nav aria-label="Page navigation">
                        <ul class="pagination mb-0 justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1">Trước</a>
                            </li>
                            <li class="page-item active">
                                <a class="page-link" href="#">1</a>
                            </li>

                            <li class="page-item">
                                <a class="page-link" href="#">Sau</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Modal Thêm Sản Phẩm -->
<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-light border-bottom">
                <h5 class="modal-title" id="addProductModalLabel">Thêm Sản Phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="addProductForm" class="needs-validation" novalidate>
                <div class="modal-body">
                    <!-- Thông Tin Cơ Bản -->
                    <div class="mb-4">
                        <h6 class="fw-bold mb-3">Thông Tin Cơ Bản</h6>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Tên Sản Phẩm</label>
                            <input type="text" class="form-control" id="addProductName" placeholder="Nhập tên sản phẩm"
                                   required/>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Thể Loại</label>
                                <select class="form-select" id="addCategory" required>
                                    <option value="">-- Chọn Thể Loại --</option>
                                    <option value="nam">Nam</option>
                                    <option value="nu">Nữ</option>
                                    <option value="doi">Đồ Đôi</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Danh Mục</label>
                                <select class="form-select" id="addSubcategory" required>
                                    <option value="">-- Chọn Danh Mục --</option>
                                    <option value="Áo Thun Nam">Áo Thun Nam</option>
                                    <option value="Áo Polo Nam">Áo Polo Nam</option>
                                    <option value="Áo Khoác Nam">Áo Khoác Nam</option>
                                    <option value="Quần Jean Nam">Quần Jean Nam</option>
                                    <option value="Quần Ngắn Nam">Quần Ngắn Nam</option>
                                    <option value="Áo Thun Nữ">Áo Thun Nữ</option>
                                    <option value="Áo Polo Nữ">Áo Polo Nữ</option>
                                    <option value="Áo Khoác Nữ">Áo Khoác Nữ</option>
                                    <option value="Váy Nữ">Váy Nữ</option>
                                    <option value="Đầm Nữ">Đầm Nữ</option>
                                    <option value="Quần dài Nữ">Quần dài Nữ</option>
                                    <option value="Quần ngắn Nữ">Quần ngắn Nữ</option>
                                    <option value="Áo khoác đôi">Áo khoác đôi</option>
                                    <option value="Áo thun đôi">Áo thun đôi</option>
                                    <option value="Đồ bộ Đôi">Đồ bộ Đôi</option>
                                </select>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Mô Tả Sản Phẩm</label>
                            <textarea class="form-control" id="addDescription" rows="3"
                                      placeholder="Nhập mô tả chi tiết sản phẩm" required></textarea>
                        </div>
                    </div>

                    <!-- Giá & Kho Hàng -->
                    <div class="mb-4">
                        <h6 class="fw-bold mb-3">Giá & Kho Hàng</h6>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Giá Bán (đ)</label>
                                <input type="number" class="form-control" id="addPrice" placeholder="0" min="0" required/>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Số Lượng Kho</label>
                                <input type="number" class="form-control" id="addQuantity" placeholder="0" min="0" required/>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Trạng Thái</label>
                            <select class="form-select" id="addStatus" required>
                                <option value="active">Hoạt Động</option>
                                <option value="outofstock">Hết Hàng</option>
                            </select>
                        </div>
                    </div>

                    <!-- Ảnh Sản Phẩm -->
                    <div class="mb-4">
                        <h6 class="fw-bold mb-3">Ảnh Sản Phẩm (Tùy chọn)</h6>
                        <input type="file" class="form-control" id="addProductImage" accept="image/*"/>
                        <small class="form-text text-muted">Chọn file ảnh (JPG, PNG, AVIF)</small>
                    </div>
                </div>
                <div class="modal-footer border-top">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times"></i> Hủy
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Thêm Sản Phẩm
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%--<script src="js/admin_Product.js"></script>--%>
</body>
</html>
