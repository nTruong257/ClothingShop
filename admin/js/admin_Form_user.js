document.addEventListener("DOMContentLoaded", function () {
    const urlParams = new URLSearchParams(window.location.search);
    const userId = urlParams.get("id");

    // Hàm lấy users từ localStorage
    function getUsers() {
        const users = localStorage.getItem("users");
        return users ? JSON.parse(users) : [];
    }

    // Lấy user data từ localStorage
    const users = getUsers();
    const userDataMap = {};

    users.forEach((user) => {
        userDataMap[user.id] = user;
    });

    if (userId) {
        // Chế độ edit
        document.getElementById("pageTitle").textContent = "Chỉnh Sửa Tài Khoản";

        const userData = userDataMap[userId];
        if (userData) {
            fillFormData(userData);
        }
    }

    function fillFormData(userData) {
        const inputs = document.querySelectorAll("input, select, textarea");

        inputs.forEach((input) => {
            switch (input.placeholder || input.name) {
                case "Nhập họ tên":
                    input.value = userData.name;
                    break;
                case "Nhập số điện thoại":
                    input.value = userData.phone;
                    break;
                case "Nhập email":
                    input.value = userData.email;
                    break;
                case "Nhập địa chỉ":
                    input.value = userData.address;
                    break;
            }

            if (input.type === "date") {
                input.value = userData.createdDate;
            }
        });

        const tinhInputs = Array.from(inputs).filter(
            (inp) => inp.placeholder && inp.placeholder.includes("Tỉnh")
        );
        if (tinhInputs.length > 0) tinhInputs[0].value = userData.city;

        const quanInputs = Array.from(inputs).filter(
            (inp) => inp.placeholder && inp.placeholder.includes("Quận")
        );
        if (quanInputs.length > 0) quanInputs[0].value = userData.district;
    }

    const customerForm = document.getElementById("customerForm");
    if (customerForm) {
        customerForm.addEventListener("submit", function (e) {
            e.preventDefault();

            if (!this.checkValidity() === false) {
                e.stopPropagation();
            }

            // Validate password matching if editing
            const newPassword = document.getElementById("newPassword");
            const confirmPassword = document.getElementById("confirmPassword");

            if (newPassword && confirmPassword && newPassword.value) {
                if (newPassword.value.length < 8) {
                    alert("Mật khẩu phải có ít nhất 8 ký tự");
                    return;
                }
                if (newPassword.value !== confirmPassword.value) {
                    alert("Mật khẩu xác nhận không trùng khớp");
                    return;
                }
            }

            const formData = {
                id: userId || null,
                name: document.querySelector('input[placeholder="Nhập họ tên"]').value,
                phone: document.querySelector('input[placeholder="Nhập số điện thoại"]').value,
                email: document.querySelector('input[placeholder="Nhập email"]').value,
                address: document.querySelector('input[placeholder="Nhập địa chỉ"]').value,
                city: Array.from(
                    document.querySelectorAll('input[placeholder*="Tỉnh"]')
                )[0].value,
                district: Array.from(
                    document.querySelectorAll('input[placeholder*="Quận"]')
                )[0].value,
                createdDate: document.querySelector('input[type="date"]').value,
                note: document.querySelector("textarea").value,
                newPassword: newPassword ? newPassword.value : null,
            };

            console.log("Form Data:", formData);

            // Lưu vào localStorage
            if (userId) {
                // Chế độ edit - update user
                const allUsers = getUsers();
                const userIndex = allUsers.findIndex((u) => u.id === userId);
                if (userIndex !== -1) {
                    allUsers[userIndex] = {
                        ...allUsers[userIndex],
                        name: formData.name,
                        phone: formData.phone,
                        email: formData.email,
                        address: formData.address,
                        city: formData.city,
                        district: formData.district,
                        note: formData.note,
                    };
                    // Nếu có password mới, cập nhật
                    if (formData.newPassword) {
                        allUsers[userIndex].password = formData.newPassword;
                    }
                    localStorage.setItem("users", JSON.stringify(allUsers));
                    alert("Cập nhật thành công!");
                }
            }

            window.location.href = "admin-customer-edit.html";
        });
    }
});
