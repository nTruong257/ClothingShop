// ==== Handle Login ====
function handleLogin(event) {
    event.preventDefault();

    const email = document.getElementById("loginEmail").value.trim();
    const password = document.getElementById("loginPassword").value.trim();

    // Reset lỗi
    document.getElementById("loginEmailError").style.display = "none";
    document.getElementById("loginPasswordError").style.display = "none";

    // Validate đơn giản
    if (!email.includes("@") || !email.includes(".")) {
        document.getElementById("loginEmailError").style.display = "block";
        return;
    }

    if (password.length < 3) {
        document.getElementById("loginPasswordError").style.display = "block";
        return;
    }

    // === LOGIN LOGIC ===
    if (email === "admin@email.com" && password === "admin12345") {
        localStorage.setItem('loggedIn', 'true'); // Lưu trạng thái login
        localStorage.setItem('userType', 'admin'); // Phân biệt admin/user nếu cần
        alert("Đăng nhập quản trị thành công!");
        window.location.href = "/admin"; // Chuyển tới admin
        return;
    }

    if (email === "user@email.com" && password === "user12345") {
        localStorage.setItem('loggedIn', 'true'); // Lưu trạng thái login
        localStorage.setItem('userType', 'user');
        alert("Đăng nhập thành công!");
        window.location.href = "index.jsp"; // Về trang chủ
        return;
    }

    // Sai thông tin
    alert("Email hoặc mật khẩu không chính xác!");
}

// ==== Toggle Password ====
function togglePassword(id) {
    const input = document.getElementById(id);
    const icon = event.currentTarget.querySelector("i");

    if (input.type === "password") {
        input.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
    } else {
        input.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
    }
}

// ==== Mobile Menu ====
function toggleMobileMenu() {
    const menu = document.getElementById("mainNavigation");
    menu.classList.toggle("active");
}

// ==== NEW: Toggle Account Dropdown ====
function toggleAccountDropdown() {
    const dropdown = document.querySelector(".account-dropdown-menu");
    dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
}

// ==== NEW: Handle Logout ====
function handleLogout() {
    localStorage.removeItem('loggedIn'); // Xóa trạng thái login
    localStorage.removeItem('userType');
    alert("Đăng xuất thành công!");
    window.location.href = "login.jsp"; // Chuyển về login
}

// ==== NEW: Initialize Account Link (chạy khi trang tải) ====
window.onload = function() {
    const accountLink = document.querySelector(".account-link");
    const loggedIn = localStorage.getItem('loggedIn');

    if (loggedIn === 'true') {
        // Đã login: Thay đổi thành button toggle dropdown
        accountLink.href = "#"; // Ngăn chuyển trang
        accountLink.addEventListener('click', function(event) {
            event.preventDefault();
            toggleAccountDropdown();
        });

        // Thêm event cho logout nếu có
        const logoutLink = document.querySelector(".account-dropdown-menu a[href='#logout']"); // Giả sử bạn thêm href="#logout" cho link Đăng xuất
        if (logoutLink) {
            logoutLink.addEventListener('click', function(event) {
                event.preventDefault();
                handleLogout();
            });
        }
    } else {
        // Chưa login: Giữ nguyên href="login.jsp"
        accountLink.href = "login.jsp";
    }
};