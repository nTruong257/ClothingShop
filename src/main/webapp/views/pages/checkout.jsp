<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleEra - Thanh toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${root}/css/header-footer.css">
    <link rel="stylesheet" href="${root}/css/checkout.css">
</head>

<body>

<jsp:include page="/views/layout/header.jsp"/>

<div id="checkout-checkout" class="container">
    <div class="row">
        <div id="content" class="col mt-5">
            <div class="row">
                <div class="col-md-7">
                    <div id="ckh_step_1">
                        <div id="checkout-shipping-address">
                            <fieldset>
                                <legend>Thông tin người dùng</legend>
                                <div id="shipping-existing" style="display: none;">
                                    <select name="address_id" id="input-shipping-address" class="form-select">
                                        <option>--- Vui lòng chọn ---</option>
                                    </select>
                                </div>
                                <br/>
                                <div id="shipping-new">
                                    <form action="${pageContext.request.contextPath}/PlaceOrderController" method="POST" id="form-shipping-address">
                                        <input type="hidden" name="hPaymentMethod" id="hPaymentMethod" value="">
                                        <input type="hidden" name="hProductName" value="${cName}">
                                        <input type="hidden" name="hProductImage" value="${cImage}">
                                        <input type="hidden" name="hSize" value="${cSize}">
                                        <input type="hidden" name="hColor" value="${cColor}">
                                        <input type="hidden" name="hQty" value="${cQty}">
                                        <input type="hidden" name="hSubTotal" value="${cSubTotal}">
                                        <input type="hidden" name="hShipping" value="${cShipping}">
                                        <input type="hidden" name="hTotal" value="${cTotal}">

                                        <div class="row mb-3">
                                            <div class="col-md-6 required">
                                                <label for="input-shipping-firstname" class="form-label">Họ tên</label>
                                                <input type="text" name="shipping_firstname" placeholder="Họ tên" id="input-shipping-firstname" class="form-control" required/>
                                            </div>
                                            <div class="col-md-6 required">
                                                <label for="input-shipping-phone" class="form-label">Điện thoại</label>
                                                <input type="text" name="shipping_phone" placeholder="Điện thoại" id="input-shipping-phone" class="form-control" required/>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-12 required">
                                                <label for="input-shipping-address-1" class="form-label">Địa chỉ</label>
                                                <input type="text" name="shipping_address_1" placeholder="Địa chỉ" id="input-shipping-address-1" class="form-control" required/>
                                            </div>
                                        </div>

                                        <div class="col mb-3 required">
                                            <label for="input-shipping-zone" class="form-label">Tỉnh / thành
                                                phố</label>
                                            <select name="shipping_zone_id" id="input-shipping-zone"
                                                    class="form-select">
                                                <option value="0">Vui lòng chọn tỉnh/thành phố</option>
                                                <option value="43">TP.Hồ Chí Minh - Nội thành</option>
                                                <option value="44">TP.Hồ Chí Minh - Ngoại thành</option>
                                            </select>
                                            <div id="error-shipping-zone" class="invalid-feedback"></div>
                                        </div>
                                        <div class="col mb-3 custom-field custom-field-30">
                                            <label for="input-shipping-custom-field-30"
                                                   class="form-label">Quận / Huyện</label>
                                            <select name="shipping_custom_field[address][30]"
                                                    id="input-shipping-custom-field-30" class="form-select">
                                                <option value="0">Vui lòng chọn quận/huyện</option>
                                            </select>
                                            <div id="error-shipping-custom-field-30"
                                                 class="invalid-feedback"></div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <label for="input-shipping-date" class="form-label">Ngày đặt hàng</label>
                                                <input type="date" name="shipping_date" id="input-shipping-date" class="form-control"/>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="input-shipping-time" class="form-label">Thời gian dự kiến</label>
                                                <select name="shipping_time" id="input-shipping-time" class="form-select">
                                                    <option value="Từ 8:00 - 12:00">Từ 8:00 - 12:00</option>
                                                    <option value="Từ 12:00 - 20:00">Từ 12:00 - 20:00</option>
                                                    <option value="Từ 8:00 - 20:00">Từ 8:00 - 20:00</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-12">
                                                <label for="input-shipping-note" class="form-label">Ghi chú [Cho shop]</label>
                                                <textarea name="shipping_note" rows="3" id="input-shipping-note" class="form-control"></textarea>
                                            </div>
                                        </div>
                                        <div class="text-end mt-4">
                                            <button type="submit" id="validate_order" class="btn btn-primary btn-lg">
                                                Xác nhận đơn hàng
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div id="checkout-confirm">
                        <legend>Chi tiết đơn hàng</legend>
                        <div class="order-summary">
                            <div class="d-flex align-items-center mb-3">
                                <img src="${pageContext.request.contextPath}${cImage}"
                                     alt="${cName}"
                                     style="width: 80px; height: 100px; object-fit: cover;"
                                     class="me-3 border">
                                <div class="flex-grow-1">
                                    <h5 class="mb-0">${cName}</h5>
                                    <small class="text-muted">Size: ${cSize} | Màu: ${cColor}</small><br>
                                    <small class="text-muted">Số lượng: ${cQty}</small>
                                </div>
                                <div class="text-end">
                                    <strong>
                                        <fmt:formatNumber value="${cSubTotal}" type="number" groupingUsed="true"/>₫
                                    </strong>
                                </div>
                            </div>

                            <hr>
                            <div class="d-flex justify-content-between">
                                <span>Tạm tính</span>
                                <span>
                                <fmt:formatNumber value="${cSubTotal}" type="number" groupingUsed="true"/>₫
                                </span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>Phí vận chuyển</span>
                                <span>
                                <fmt:formatNumber value="${cShipping}" type="number" groupingUsed="true"/>₫
                                </span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between align-items-center">
                                <h4 class="text-danger">Tổng cộng</h4>
                                <h3 class="text-primary">
                                    <fmt:formatNumber value="${cTotal}" type="number" groupingUsed="true"/>₫
                                </h3>
                            </div>
                            <div id="checkout-payment-method" class="mb-4">
                                <h4 class="payment-title">Phương thức thanh toán</h4>
                                <form id="form-payment-method">
                                    <fieldset>
                                        <div class="input-group">
                                            <div class="input-payment-method-group">
                                                <div class="form-check">
                                                    <input type="radio" name="payment_method"
                                                           value="bank_transfer"
                                                           id="input-payment-method-bank_transfer"
                                                           class="form-check-input input-payment-method">
                                                    <label for="input-payment-method-bank_transfer"
                                                           class="form-check-label">
                                                        <img class="payment-method-icon"
                                                             src="${root}/images/image_product/logoNH.png">Chuyển khoản
                                                        ngân hàng
                                                        <span class="payment-brand-icon-bank_transfer"></span>
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input type="radio" name="payment_method" value="cheque"
                                                           id="input-payment-method-cheque"
                                                           class="form-check-input input-payment-method">
                                                    <label for="input-payment-method-cheque"
                                                           class="form-check-label">
                                                        <img class="payment-method-icon"
                                                             src="${root}/images/image_product/momo.png">Ví điện tử Momo
                                                        <span class="payment-brand-icon-cheque"></span>
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input type="radio" name="payment_method" value="paypal"
                                                           id="input-payment-method-paypal"
                                                           class="form-check-input input-payment-method">
                                                    <label for="input-payment-method-paypal"
                                                           class="form-check-label">
                                                        <img class="payment-method-icon"
                                                             src="${root}/images/image_product/visa.png">
                                                        Thẻ Visa
                                                        <span class="payment-brand-icon-paypal"></span>
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input type="radio" name="payment_method" value="cod"
                                                           id="input-payment-method-cod"
                                                           class="form-check-input input-payment-method">
                                                    <label for="input-payment-method-cod"
                                                           class="form-check-label">
                                                        <img class="payment-method-icon"
                                                             src="${root}/images/image_product/logothanhtoan.png">
                                                        Thanh toán khi giao hàng
                                                        <span class="payment-brand-icon-cod"></span>
                                                    </label>
                                                </div>
                                            </div>
                                            <button type="button" id="button-payment-method"
                                                    class="btn btn-light d-none"><i
                                                    class="fa-solid fa-rotate"></i></button>
                                        </div>
                                    </fieldset>
                                </form>
                                <div class="mb-2 mt-3">
                                    <div class="form-check text-end">
                                        <input type="checkbox" name="agree" value="1" id="input-agree"
                                               class="form-check-input" checked="">
                                        <label for="input-agree" class="form-check-label">Tôi đã đọc và đồng ý
                                            với
                                            <a href="https://www.flowercorner.vn/info/dieu-khoan-dieu-kien"
                                               class="modal-link"><b> Điều khoản
                                                &amp; Điều kiện </b></a>
                                        </label>
                                    </div>
                                </div>
                                <hr>

                                <div class="mt-3" id="paypal-button-container"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ===== FOOTER ===== -->
<jsp:include page="/views/layout/footer.jsp"/>

<script src="<c:url value='/js/checkout.js'/>"></script>
<script src="${root}/js/main.js"></script>

</body>

</html>
