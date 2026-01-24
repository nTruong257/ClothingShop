<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleEra - Đánh giá sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${root}/css/header-footer.css">
    <link rel="stylesheet" href="${root}/css/review.css">
</head>
<body>
<jsp:include page="/views/layout/header.jsp" />

<div class="review-container">
    <h2>Đánh giá sản phẩm</h2>

    <form action="${root}/submit-review" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="productId" value="${param.productId}">

        <input type="hidden" name="rating" id="ratingInput" value="5">

        <select name="color" id="color">...</select>
        <select name="size" id="size">...</select>
        <textarea name="content" id="note"></textarea>
        <input type="file" name="images">

        <button type="submit" class="btn-submit">Gửi đánh giá</button>
    </form>
    <!-- Popup thông báo thành công -->
    <div class="success-popup" id="successPopup">
        <div class="popup-box">
            <h3>Gửi đánh giá thành công!</h3>
            <p>Cảm ơn bạn đã chia sẻ trải nghiệm.</p>
            <button id="closePopup" onclick="location.href='index.html'">Đóng</button>

        </div>
    </div>

</div>

<jsp:include page="/views/layout/footer.jsp" />

<script src="${root}/js/review.js"></script>
<script>
    // Thêm đoạn script này để khi click vào ngôi sao thì cập nhật giá trị vào input ẩn
    document.querySelectorAll('.star').forEach(star => {
        star.addEventListener('click', function() {
            document.getElementById('ratingInput').value = this.getAttribute('data-value');
        });
    });
</script>
</body>
</html>
