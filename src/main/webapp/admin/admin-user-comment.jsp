<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>StyleEra - Quản lý bình luận</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="css/admin.css"/>
</head>
<body>

<c:set var="currentPage" value="comment" scope="request"/>
<!-- ===== HEADER ===== -->
<%@ include file="/admin/layout/Layoutadmin.jsp" %>
<main class="admin-content">
    <!-- Page Header -->
    <div class="page-header mb-5">
        <div>
            <h1 class="page-title">Quản lý Bình Luận</h1>
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
                    <label class="form-label">Ngày Bình luận</label>
                    <select class="form-select" id="categoryFilter">
                        <option value="">Tất Cả các ngày</option>
                        <option value="admin">Bình luận cũ nhất</option>
                        <option value="usr">Bình luận mới nhất</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <div>
        <tbody>
        <c:forEach items="${reviews}" var="r">
            <tr>
                    <%-- Hiển thị ID của bình luận --%>
                <td>#${r.id}</td>

                    <%-- Hiển thị Tên khách hàng --%>
                <td>${r.userName}</td>

                    <%-- Hiển thị Ngày bình luận (đã định dạng ngày/tháng/năm) --%>
                <td><fmt:formatDate value="${r.createdAt}" pattern="dd-MM-yyyy HH:mm"/></td>

                    <%-- Hiển thị Ảnh bình luận --%>
                <td>
                    <c:choose>
                        <c:when test="${not empty r.imageUrl}">
                            <img src="${root}${r.imageUrl}"
                                 style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;">
                        </c:when>
                        <c:otherwise>
                            <span class="text-muted small">no picture</span>
                        </c:otherwise>
                    </c:choose>
                </td>

                    <%-- Hiển thị Màu và Size (Sử dụng badge Bootstrap cho đẹp) --%>
                <td><span class="badge bg-info text-dark">${not empty r.color ? r.color : 'N/A'}</span></td>
                <td><span class="badge bg-secondary">${not empty r.size ? r.size : 'N/A'}</span></td>

                    <%-- Hiển thị Nội dung lời bình luận --%>
                <td style="max-width: 250px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                        ${r.content}
                </td>

                    <%-- Nút hành động Xóa --%>
                <td>
                    <button class="btn btn-sm btn-danger"
                            onclick="if(confirm('Bạn có chắc chắn muốn xóa bình luận này?')) { window.location.href='delete-review?id=${r.id}'; }"
                            title="Xóa">
                        <i class="fas fa-trash"></i>
                    </button>
                </td>
            </tr>
        </c:forEach>

        <%-- Hiển thị dòng thông báo nếu không có dữ liệu --%>
        <c:if test="${empty reviews}">
            <tr>
                <td colspan="8" class="text-center py-4 text-muted">Hiện chưa có bình luận nào để quản lý.</td>
            </tr>
        </c:if>
        </tbody>

    </div>
</main>
</body>
</html>
