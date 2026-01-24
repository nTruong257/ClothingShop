<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>StyleEra - Thêm/Chỉnh Sửa Sản Phẩm</title>
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
                    <h1 class="page-title" id="pageTitle">Chỉnh sửa Sản Phẩm</h1>
                </div>
                <div class="page-actions">
                    <a href="${root}/admin-products" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left"></i> Quay Lại
                    </a>
                </div>
            </div>

            <div class="row">
                <!-- Left Column - Form -->
                <div class="col-lg-8">
                    <form id="productForm"
                          action="${pageContext.request.contextPath}/AdminEditProduct"
                          method="post"
                          enctype="multipart/form-data"
                          class="needs-validation"
                          novalidate>

                        <input type="hidden" name="productId" value="${product.product_id}">
                        <input type="hidden" name="variantId"
                               value="${variant != null ? variant.variantId : 0}">


                        <!-- Basic Information -->
                        <div class="card shadow-sm mb-4">
                            <div class="card-header bg-light border-bottom">
                                <h6 class="mb-0">Thông Tin Cơ Bản</h6>
                            </div>
                            <div class="card-body">

                                <!-- Tên Sản Phẩm -->
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Tên Sản Phẩm</label>
                                    <input type="text"
                                           class="form-control"
                                           name="productName"
                                           value="${product.product_name}"
                                           required>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Phân Loại</label>
                                        <select class="form-select" name="parentCategoryId" required>
                                            <c:forEach items="${parents}" var="pc">
                                                <option value="${pc.id}"
                                                        <c:if test="${pc.id == product.subcategories.category.id}">
                                                            selected
                                                        </c:if>>
                                                        ${pc.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Danh Mục</label>
                                        <select class="form-select"
                                                name="subCategoryId"
                                                required>
                                            <option value="">-- Chọn Danh Mục --</option>
                                            <option value="1" ${product.subcategories.id == 1 ? "selected" : ""}>Áo Thun Nam</option>
                                            <option value="2" ${product.subcategories.id == 2 ? "selected" : ""}>Áo Polo Nam</option>
                                            <option value="3" ${product.subcategories.id == 3 ? "selected" : ""}>Áo Khoác Nam</option>
                                            <option value="4" ${product.subcategories.id == 4 ? "selected" : ""}>Quần Jean Nam</option>
                                            <option value="5" ${product.subcategories.id == 5 ? "selected" : ""}>Quần Ngắn Nam</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Giá và số lượng -->
                        <div class="card shadow-sm mb-4">
                            <div class="card-header bg-light border-bottom">
                                <h6 class="mb-0">Giá & Kho Hàng</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">

                                    <!-- Price -->
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Giá Bán (đ)</label>
                                        <input type="number"
                                               class="form-control"
                                               name="price"
                                               value="${product.price}"
                                               min="0"
                                               required>
                                    </div>

                                    <!-- Quantity -->
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Số Lượng Kho</label>
                                        <input type="number"
                                               class="form-control"
                                               name="quantity"
                                               value="${variant != null ? variant.quantity : 0}"
                                               min="0"
                                               required>
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
                                <input type="file" class="form-control" id="productImages" name="productImages" accept="image/*" multiple/>
                                <div class="form-text">
                                    Chọn 1 hoặc nhiều ảnh (JPG, PNG) - Tùy chọn
                                </div>
                                <div id="imgPreview" class="d-flex flex-column gap-2 mt-3"></div>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex gap-2">
                        <button type="submit" form="productForm" class="btn btn-primary btn-lg flex-grow-1">
                            <i class="fas fa-save"></i> Cập Nhật Sản Phẩm
                        </button>
                        <a href="${root}/admin-products" class="btn btn-outline-secondary btn-lg flex-grow-1">
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
<%--<script src="js/admin_Form.js"></script>--%>
</body>
</html>
