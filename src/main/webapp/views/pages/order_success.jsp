<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />

<!doctype html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <title>StyleEra - Thành công</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${root}/css/header-footer.css">
    <link rel="stylesheet" href="${root}/css/oder_success.css">
</head>

<body>
<jsp:include page="/views/layout/header.jsp" />

<div class="page-wrap">
    <main class="success-card" role="main">
        <div class="success-header">
            <div class="tick-wrap" aria-hidden="true">
                <span class="tick">
                    <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                      <path d="M4 12l4 4L20 6"></path>
                    </svg>
                </span>
            </div>
            <div>
                <h1 class="success-title">Bạn đã đặt hàng thành công!</h1>
                <p class="success-sub">Cảm ơn bạn <strong>${uName}</strong> đã mua sắm tại <strong>StyleEra</strong>. Đơn hàng của bạn đang được xử lý.</p>
            </div>
        </div>

        <div class="order-meta">
            <div>
                <div class="order-id" id="orderId">Mã đơn hàng: #ORD-${System.currentTimeMillis() % 1000000}</div>
                <div class="note">Ngày đặt: <span id="orderDate">${uDate}</span></div>
            </div>
            <div class="order-actions">
                <button class="btn" id="viewOrderBtn">
                    <a href="order_status.jsp">Xem đơn hàng</a>
                </button>
            </div>
        </div>

        <section class="section">
            <h4>Thông tin giao hàng</h4>
            <div class="info-grid">
                <div class="info-box">
                    <div class="info-label">Tên</div>
                    <div class="info-val" id="shipName">${uName}</div>
                </div>
                <div class="info-box">
                    <div class="info-label">Số điện thoại</div>
                    <div class="info-val" id="shipPhone">${uPhone}</div>
                </div>
                <div class="info-box" style="grid-column:1 / -1;">
                    <div class="info-label">Địa chỉ</div>
                    <div class="info-val" id="shipAddress">${uAddress}</div>
                </div>
                <div class="info-box">
                    <div class="info-label">Thời gian dự kiến giao</div>
                    <div class="info-val" id="shipETA">${uTime}, ${uDate}</div>
                </div>
                <div class="info-box">
                    <div class="info-label">Phương thức thanh toán</div>
                    <div class="info-val" id="payMethod">
                        <c:choose>
                            <c:when test="${uPayment == 'cod'}">Thanh toán khi giao hàng (COD)</c:when>
                            <c:when test="${uPayment == 'bank_transfer'}">Chuyển khoản ngân hàng</c:when>
                            <c:when test="${uPayment == 'cheque'}">Ví điện tử Momo</c:when>
                            <c:otherwise>Thẻ Visa</c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </section>

        <section class="section">
            <h4>Ghi chú</h4>
            <div class="info-box" style="min-height:64px">${uNote != "" ? uNote : "Không có ghi chú"}</div>
        </section>
    </main>

    <aside class="summary-card" aria-labelledby="summaryTitle">
        <div class="summary-title" id="summaryTitle">Chi tiết đơn hàng</div>

        <div class="product-row">
            <img src="${root}${pImage}" alt="${pName}">
            <div style="flex:1">
                <div class="prod-name">${pName}</div>
                <div class="prod-meta">Size: ${cSize} | Màu: ${cColor}</div>
            </div>
            <div style="text-align:right">
                <div style="font-weight:600">${pTotal}₫</div>
                <div class="prod-meta">SL: ${pQty}</div>
            </div>
        </div>
        <hr>
        <div class="total">
            <div style="font-weight:800;font-size: 20px; color: #ff6f61;">Tổng cộng</div>
            <div class="num">${pTotal}₫</div>
        </div>

        <div style="display:flex;gap:10px;margin-top:14px;flex-direction: row-reverse;">
            <button class="btn" onclick="location.href='${root}/index.jsp'">Tiếp tục mua sắm</button>
        </div>
    </aside>
</div>

<jsp:include page="/views/layout/footer.jsp" />
<script src="${root}/js/main.js"></script>
</body>
</html>