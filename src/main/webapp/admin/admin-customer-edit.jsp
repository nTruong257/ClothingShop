<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>StyleEra - Người Dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="css/admin.css"/>
</head>

<body>
<!-- ===== HEADER ===== -->
<c:set var="currentPage" value="customer" scope="request"/>
<%@ include file="/admin/layout/Headeradmin.jsp" %>

        <!-- ===== CONTENT ===== -->
        <main class="admin-content">
            <!-- Page Header -->
            <div class="page-header mb-5">
                <div>
                    <h1 class="page-title">Quản lý Tài Khoản</h1>
                </div>
                <div class="page-actions">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">
                        <i class="fas fa-plus"></i> Thêm Tài Khoản
                    </button>
                </div>
            </div>
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <div class="row g-3 align-items-end">
                        <div class="col-md-6">
                            <label class="form-label">Tìm Kiếm</label>
                            <input type="text" class="form-control" id="searchInput" placeholder="Tên tài khoản"/>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Vai Trò</label>
                            <select class="form-select" id="categoryFilter">
                                <option value="">Tất Cả Vai Trò</option>
                                <option value="admin">Admin</option>
                                <option value="usr">User</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="tab-pane">
                    <div class="card shadow-sm">
                        <div class="card-header bg-light border-bottom d-flex justify-content-between align-items-center">
                            <h6 class="mb-0">Danh Sách Khách Hàng</h6>
                            <span class="text-muted small">Tổng cộng: <strong>3</strong> Người dùng</span>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0">
                                    <thead class="table-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên</th>
                                        <th>Email</th>
                                        <th>Vai trò</th>
                                        <th>Mật Khẩu</th>
                                        <th>Số ĐT</th>
                                        <th>Ngày Tham Gia</th>
                                        <th>Hành Động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>#U001</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>nguyenvana@email.com</td>
                                        <td><span class="badge bg-success">User</span></td>
                                        <td>*******</td>
                                        <td>0912345678</td>
                                        <td>05/01/2025</td>
                                        <td>
                                            <a href="admin-form-user.jsp?id=U001" class="btn btn-sm btn-warning" title="Chỉnh sửa">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <button class="btn btn-sm btn-danger" title="Xóa">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#U002</td>
                                        <td>Trần Thị B</td>
                                        <td>tranthib@email.com</td>
                                        <td><span class="badge bg-success">User</span></td>
                                        <td>*******</td>
                                        <td>0987654321</td>
                                        <td>10/02/2025</td>
                                        <td>
                                            <a href="admin-form-user.jsp?id=U002" class="btn btn-sm btn-warning" title="Chỉnh sửa">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <button class="btn btn-sm btn-danger" title="Xóa">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>#A003</td>
                                        <td>Quản Trị Viên</td>
                                        <td>admin@styleera.com</td>
                                        <td><span class="badge bg-warning">Admin</span></td>
                                        <td>*******</td>
                                        <td>0904899626</td>
                                        <td>11/12/2019</td>
                                        <td>
                                            <a href="admin-profile.jsp" class="btn btn-sm btn-warning" title="Chỉnh sửa">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header bg-light border-bottom">
                        <h5 class="modal-title" id="addUserModalLabel">Thêm Tài Khoản</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="addUserForm" class="needs-validation" novalidate>
                        <div class="modal-body">
                            <div class="mb-4">
                                <h6 class="fw-bold mb-3">Thông Tin Cá Nhân</h6>
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Họ Tên</label>
                                    <input type="text" class="form-control" id="addName" placeholder="Nhập họ tên" required/>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Email</label>
                                        <input type="email" class="form-control" id="addEmail" placeholder="Nhập email" required/>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Số Điện Thoại</label>
                                        <input type="tel" class="form-control" id="addPhone" placeholder="Nhập số điện thoại" required/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Vai Trò</label>
                                        <select class="form-select" id="addRole" required>
                                            <option value="">-- Chọn Vai Trò --</option>
                                            <option value="user">User</option>
                                            <option value="admin">Admin</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <!-- Địa Chỉ -->
                            <div class="mb-4">
                                <h6 class="fw-bold mb-3">Địa Chỉ</h6>

                                <div class="mb-3">
                                    <label class="form-label fw-bold">Địa Chỉ Người Dùng</label>
                                    <input type="text" class="form-control" id="addAddress" placeholder="Nhập địa chỉ" required/>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Tỉnh/Thành Phố</label>
                                        <input type="text" class="form-control" id="addCity" placeholder="Tỉnh/Thành phố" required/>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold">Quận/Huyện</label>
                                        <input type="text" class="form-control" id="addDistrict" placeholder="Quận/Huyện" required/>
                                    </div>
                                </div>
                            </div>

                            <!-- Mật Khẩu -->
                            <div class="mb-4">
                                <h6 class="fw-bold mb-3">Thông tin Mật Khẩu</h6>
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Mật Khẩu</label>
                                    <input type="password" class="form-control" id="addPassword" placeholder="Nhập mật khẩu" required/>
                                    <small class="form-text text-muted">Mật khẩu phải có ít nhất 8 ký tự</small>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-bold">Xác Nhận Mật Khẩu</label>
                                    <input type="password" class="form-control" id="addConfirmPassword" placeholder="Xác nhận mật khẩu" required/>
                                </div>
                            </div>

                            <!-- Ghi Chú -->
                            <div class="mb-4">
                                <h6 class="fw-bold mb-3">Ghi Chú</h6>
                                <textarea class="form-control" id="addNote" rows="3" placeholder="Thêm ghi chú (tùy chọn)"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer border-top">
                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                <i class="fas fa-times"></i> Hủy
                            </button>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Thêm Tài Khoản
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </div>
</div>
<!-- ===== FOOTER ===== -->
<%@ include file="/admin/layout/Footeradmin.jsp" %>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom JS -->
<script src="js/admin-common.js"></script>
<script src="js/admin_customer.js"></script>
</body>
</html>
