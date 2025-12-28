// Xoá giỏ hàng ko reload lại trang:
function removeItem(variantId, btn) {
    fetch(contextPath + "/del-item", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: new URLSearchParams({ variantId: String(variantId) }).toString()
    })
        .then(res => res.json())
        .then(data => {
            if (data.status === "success") {
                const row = btn.closest("tr");
                if (row) row.remove();

                const badge = document.querySelector(".cart-badge");
                if (badge) badge.innerText = data.totalQuantity;

                // cập nhật tổng đơn hàng
                const totalQtyElement = document.getElementById("total-quantity");
                if (totalQtyElement) {
                    totalQtyElement.innerText = data.totalQuantity;
                }

                // cập nhật tổng giá tiền
                const totalPriceElement = document.getElementById("total-price");
                if (totalPriceElement && data.cartTotal !== undefined) {
                    totalPriceElement.innerText = data.cartTotal + " VNĐ";
                }
            } else {
                alert(data.msg);
            }
        })
        .catch(err => console.error(err));
}