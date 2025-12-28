//xử lý không reload trang khi thêm giỏ hàng dùng Ajax
function addToCart(variantId) {
    const contextPath = window.contextPath || '';

    fetch(`${contextPath}/addcart`, {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "X-Requested-With": "XMLHttpRequest"
        },
        body: new URLSearchParams({
            variantId: String(variantId),
            quantity: "1"
        })
    })
        .then(res => res.json())
        .then(data => {
            if (data.status === "success") {
                // Cập nhật số lượng trong cartBadge (có id "cartBadge")
                document.getElementById("cartBadge").innerText = data.totalQuantity;
                showToast(data.msg);
            } else {
                alert(data.msg);
            }
        })
        .catch(err => console.error(err));
}

//Hiển thị hộp thông báo thêm giỏ hàng ra 1 giây
function showToast(msg) {
    const toast = document.createElement("div");
    toast.className = "alert alert-success position-fixed top-0 end-0 m-4";
    toast.style.zIndex = "9999";
    toast.innerHTML = `<i class="fa-solid fa-circle-check"></i> ${msg}`;
    document.body.appendChild(toast);

    setTimeout(() => toast.remove(), 1000);
}