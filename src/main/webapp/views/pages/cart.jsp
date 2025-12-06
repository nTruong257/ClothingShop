<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>StyleEra - Giỏ hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="${root}/css/header-footer.css"/>
    <link rel="stylesheet" href="${root}/css/cartstyle.css"/>
</head>
<body>

<jsp:include page="/views/layout/header.jsp" />

<main class="container product-page">
    <nav aria-label="breadcrumb" class="mt-3 mb-3">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.jsp">Trang Chủ</a></li>
            <li class="breadcrumb-item active" id="breadcrumb-category">Giỏ hàng</li>
        </ol>
    </nav>
    <div class="container-md text-center mt-3 mb-3">
        <div class="header">
            <div class="row">
                <div class="col-lg-8 form-left">
                    <div class="table_shopping_cart">
                        <table class="table">
                            <thead>
                            <tr class="table-dark">
                                <th colspan="2">SẢN PHẨM</th>
                                <th>SỐ LƯỢNG</th>
                                <th>TỔNG GIÁ TIỀN</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <div class="product-item img_product">
                                        <img src="${root}/images/product_item_women/6/6-1/trangphuc.png"/>
                                    </div>
                                </td>
                                <td>
                                    <div class="product-item">
                                        <p>${item.productName}</p>
                                        <h6>${item.price}</h6>
                                    </div>
                                </td>
                                <td>
                                    <div class="quantity-item">
                                        <span class="fa-solid fa-less-than"></span>
                                        <input type="text" value="${item.quantity}"/>
                                        <span class="fa-solid fa-greater-than"></span>
                                    </div>
                                </td>
                                <td>
                                    <div class="price-item">
                                        <div class="cart_price">${item.totalPrice} VNĐ</div>
                                    </div>
                                </td>
                                <td>
                                    <i class="fa-solid fa-circle-xmark closed" style="color: #b61111ff"
                                       onclick="removeItemCart(${item.productId})"
                                    ></i>

                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="my_button">
                            <a href="index.jsp" class="continute_btn">TIẾP TỤC MUA SẮM</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-4 col-sm-6 form-right">
                    <div class="cart_total">
                        <h5>ĐƠN HÀNG CỦA BẠN</h5>
                        <ul>
                            <li>
                                <span class="label">TỔNG ĐƠN HÀNG:</span>
                                <span class="value"><strong>0</strong></span>
                            </li>
                            <li>
                                <span class="label">TỔNG GIÁ TIỀN:</span>
                                <span class="value"><strong>0 VNĐ</strong></span>
                            </li>
                        </ul>
                        <div class="cart-actions">
                            <a href="checkout.jsp" class="btn btn-success">THANH TOÁN</a>
                            <a href="order_status.jsp" class="btn btn-danger">TRẠNG THÁI ĐƠN HÀNG</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/views/layout/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${root}/js/main.js"></script>
<script src="${root}/js/cartPage.js"></script>
</body>
</html>
