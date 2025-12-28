//xử lý không reload trang khi thêm giỏ hàng dùng Ajax
function addToCart(variantId) {
    let contextPath = window.contextPath;

    if (!contextPath) {
        const parts = window.location.pathname.split("/").filter(Boolean);
        contextPath = parts.length > 0 ? `/${parts[0]}` : "";
    }
    fetch(`${contextPath}/addcart`, {
        method: "POST",
        credentials: "same-origin",
        cache: "no-store",
        headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8" },
        body: new URLSearchParams({ variantId: String(variantId), quantity: "1" })
    })
        .then(async (r) => {
            if (!r.ok) {
                const txt = await r.text().catch(() => "");
                console.error("addcart failed:", r.status, txt);
                throw new Error(`HTTP ${r.status}`);
            }
            return r.json();
        })
        .then((data) => {
            if (data.status !== "success") {
                console.warn("addcart error:", data);
                alert(data.msg || "Không thể thêm vào giỏ hàng");
                return;
            }

            const qty = data.totalQuantity ?? 0;

            if (typeof window.setCartBadgeCount === "function") {
                window.setCartBadgeCount(qty);
            } else {
                document.querySelectorAll(".cart-badge").forEach((el) => {
                    el.textContent = String(qty);
                    el.style.display = Number(qty) > 0 ? "flex" : "none";
                });
            }
            if (typeof showToast === "function" && data.msg) showToast(data.msg);
        })
        .catch((err) => {
            console.error("Lỗi thêm vào giỏ hàng:", err);
            alert("Có lỗi xảy ra. Vui lòng thử lại!");
        });
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