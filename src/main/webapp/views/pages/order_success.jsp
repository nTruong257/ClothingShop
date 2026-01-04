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
                <p class="success-sub">Cảm ơn bạn đã mua sắm tại <strong>StyleEra</strong>. Đơn hàng của bạn đang được
                    xử lý.
                </p>
            </div>
        </div>

        <div class="order-meta">
            <div class="order-id">Mã đơn hàng: #ORD-${System.currentTimeMillis() % 1000000}</div>
            <div class="note">Ngày đặt: <span>${uDate}</span></div>
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
                    <div class="info-val">${uName}</div>
                </div>
                <div class="info-box">
                    <div class="info-label">Số điện thoại</div>
                    <div class="info-val">${uPhone}</div>
                </div>
                <div class="info-box" style="grid-column:1 / -1;">
                    <div class="info-label">Địa chỉ</div>
                    <div class="info-val" >${uAddress}</div>
                </div>
                <div class="info-box">
                    <div class="info-label">Thời gian dự kiến giao</div>
                    <div class="info-val" >${uTime}, ${uDate}</div>
                </div>
                <div class="info-box">
                    <div class="info-label">Phương thức thanh toán</div>
                    <div class="info-val">
                        <c:choose>
                            <c:when test="${uPayment == 'bank_transfer'}">Chuyển khoản ngân hàng</c:when>
                            <c:when test="${uPayment == 'cheque'}">Ví điện tử Momo</c:when>
                            <c:when test="${uPayment == 'paypal'}">Thẻ Visa</c:when>
                            <c:when test="${uPayment == 'cod'}">Thanh toán khi giao hàng (COD)</c:when>
                            <c:otherwise>Chưa xác định (${uPayment})</c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </section>

        <section class="section">
            <h4>Ghi chú</h4>
            <div class="info-box" style="min-height:64px">${uNote}</div>
        </section>

    </main>

    <aside class="summary-card" aria-labelledby="summaryTitle">
        <div class="summary-title" id="summaryTitle">Chi tiết đơn hàng</div>

        <div class="product-row">
            <img src="${root}${pImage}" alt="${pName}">
            <div style="flex:1">
                <div class="prod-name">${pName}</div>
                <div class="prod-meta">Size ${pSize} • Màu: ${pColor}</div>
            </div>
            <div style="text-align:right">
                <div style="font-weight:600"> <fmt:formatNumber value="${cTotal}" type="number" groupingUsed="true"/>₫</div>
                <div class="prod-meta">SL: ${pQty}</div>
            </div>
        </div>
        <hr>
        <div class="price-row">
            <div>Tạm tính</div>
            <div>
                <fmt:formatNumber value="${cSubTotal}" type="number" groupingUsed="true"/>đ
            </div>
        </div>
        <div class="price-row">
            <div>Phí vận chuyển</div>
            <div>
                <fmt:formatNumber value="${cShipping}" type="number" groupingUsed="true"/>đ
            </div>
        </div>
        <hr>
        <div class="total">
            <h4 class="text-danger">Tổng cộng</h4>
            <h3 class="text-primary">
                <fmt:formatNumber value="${cTotal}" type="number" groupingUsed="true"/>₫
            </h3>
        </div>

        <div class="payment-method">
            <h4 style="margin:10px 0 8px 0">Phương thức thanh toán đã chọn</h4>

            <c:choose>
                <c:when test="${uPayment == 'bank_transfer'}">
                    <div class="pm-item">
                        <img src="${root}/images/image_product/logoNH.png" alt="bank">
                        <div>Chuyển khoản ngân hàng</div>
                    </div>
                </c:when>
                <c:when test="${uPayment == 'cheque'}">
                    <div class="pm-item">
                        <img src="${root}/images/image_product/momo.png" alt="momo">
                        <div>Ví điện tử Momo</div>
                    </div>
                </c:when>
                <c:when test="${uPayment == 'paypal'}">
                    <div class="pm-item">
                        <img src="${root}/images/image_product/visa.png" alt="visa">
                        <div>Thẻ Visa</div>
                    </div>
                </c:when>
                <c:when test="${uPayment == 'cod'}">
                    <div class="pm-item">
                        <img src="${root}/images/image_product/logothanhtoan.png" alt="cod">
                        <div>Thanh toán khi giao hàng</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="pm-item">
                        <div>Chưa xác định phương thức</div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <div style="display:flex;gap:10px;margin-top:14px;flex-direction: row-reverse;">
            <button class="btn" onclick="location.href='index.html'">Tiếp tục mua sắm</button>
        </div>

    </aside>

</div>

<jsp:include page="/views/layout/footer.jsp" />

<script src="<c:url value='/js/checkout.js'/>"></script>
<script src="../../js/main.js"></script>
</body>

</html>