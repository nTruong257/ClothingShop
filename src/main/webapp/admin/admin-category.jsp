<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>StyleEra - Quản Lý Danh Mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="${root}/admin/css/admin.css"/>
</head>
<body>
<c:set var="currentPage" value="category" scope="request"/>
<!-- ===== HEADER ===== -->
<%@ include file="/admin/layout/Layoutadmin.jsp" %>

<main class="admin-content">
    <div class="page-header mb-5">
        <div>
            <h1 class="page-title">Quản Lý Danh Mục</h1>
        </div>
        <div class="page-actions">
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">
                <i class="fas fa-plus"></i> Thêm Danh Mục
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
                    <label class="form-label">Danh Mục</label>
                    <select class="form-select categoryFilter" name="parent">
                        <option value="">Tất Cả Danh Mục</option>
                        <option value="nam" ${param.parent == 'nam' ? 'selected' : ''}>Nam</option>
                        <option value="nu" ${param.parent == 'nu' ? 'selected' : ''}>Nữ</option>
                        <option value="doi" ${param.parent == 'doi' ? 'selected' : ''}>Đồ Đôi</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Phân Loại</label>
                    <select class="form-select categoryFilter" name="sub">
                        <option value="">Tất Cả Phân Loại</option>

                        <option value="Áo Thun" ${param.sub == 'Áo Thun' ? 'selected' : ''}>Áo Thun</option>
                        <option value="Áo Polo" ${param.sub == 'Áo Polo' ? 'selected' : ''}>Áo Polo</option>
                        <option value="Áo Khoác Nam" ${param.sub == 'Áo Khoác Nam' ? 'selected' : ''}>Áo Khoác Nam</option>
                        <option value="Quần Jean" ${param.sub == 'Quần Jean' ? 'selected' : ''}>Quần Jean</option>
                        <option value="Quần Ngắn" ${param.sub == 'Quần Ngắn' ? 'selected' : ''}>Quần Ngắn</option>

                        <option value="Áo Khoác" ${param.sub == 'Áo Khoác' ? 'selected' : ''}>Áo Khoác</option>
                        <option value="Váy" ${param.sub == 'Váy' ? 'selected' : ''}>Váy</option>
                        <option value="Đầm" ${param.sub == 'Đầm' ? 'selected' : ''}>Đầm</option>

                        <option value="Áo khoác đôi" ${param.sub == 'Áo khoác đôi' ? 'selected' : ''}>Áo khoác đôi</option>
                        <option value="Áo thun đôi" ${param.sub == 'Áo thun đôi' ? 'selected' : ''}>Áo thun đôi</option>
                        <option value="Đồ bộ Đôi" ${param.sub == 'Đồ bộ Đôi' ? 'selected' : ''}>Đồ bộ Đôi</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</main>
<div class="card shadow-sm">
    <div class="card-header bg-light border-bottom d-flex justify-content-between align-items-center">
        <h6 class="mb-0">Danh Sách Các Danh Mục Sản Phẩm</h6>
        <span class="text-muted small">Tổng cộng:
            <strong>
                <c:set var="total" value="0"/>
                <c:forEach items="${parentCategoryList}" var="p">
                    <c:set var="total" value="${total + p.subCategories.size()}"/>
                </c:forEach>
                ${total}
            </strong>
        </span>

    </div>
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0" id="productsTable">
                <thead class="table-light">
                <tr class="text-center align-middle">
                    <th>ID</th>
                    <th>Ảnh Danh Mục</th>
                    <th>Tên Danh Mục</th>
                    <th>Phân Loại</th>
                    <th style="min-width: 250px">Mô Tả</th>
                    <th style="width: 150px">Hành Động</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty parentCategoryList}">
                        <tr>
                            <td colspan="6" class="text-center">
                                <i class="fas fa-inbox fa-2x"></i>
                                <p>Chưa có danh mục nào</p>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>

                        <c:forEach items="${parentCategoryList}" var="p">
                            <c:forEach items="${p.subCategories}" var="s">
                                <tr class="text-center align-middle">
                                    <td>${s.id}</td>
                                    <td>
                                        <c:if test ="${not empty s.image}">
                                            <img src="${root}${s.image}" width="80" height="80"
                                                 style="object-fit:cover;border-radius:4px">
                                        </c:if>
                                        <c:if test="${empty s.image}">
                                            <img src="https://via.placeholder.com/60" alt="No image" width="60" height="60">
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${p.name eq 'Nam'}">
                                                <span class="badge bg-primary">${p.name}</span>
                                            </c:when>
                                            <c:when test="${p.name eq 'Nữ'}">
                                                <span class="badge bg-danger">${p.name}</span>
                                            </c:when>
                                            <c:when test="${p.name eq 'Đồ Đôi'}">
                                                <span class="badge bg-dark">${p.name}</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td> <strong>${s.name}</strong> </td>

                                    <td>${empty s.description ? "—" : s.description}</td>
                                    <td>
                                        <button class="btn btn-sm btn-danger" title="Xóa">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>
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
<script src="${root}/admin/js/admin_Product.js"></script>
</body>
</html>
