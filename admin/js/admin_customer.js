// Sidebar toggle for mobile
document.getElementById("sidebarToggle").addEventListener("click", function () {
  document.querySelector(".admin-sidebar").classList.toggle("active");
});

// Form validation
(function () {
  "use strict";
  window.addEventListener(
    "load",
    function () {
      var forms = document.querySelectorAll(".needs-validation");
      Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener(
          "submit",
          function (event) {
            // Kiểm tra mật khẩu
            const newPassword = document.getElementById("newPassword").value;
            const confirmPassword =
              document.getElementById("confirmPassword").value;

            if (newPassword && newPassword !== confirmPassword) {
              event.preventDefault();
              event.stopPropagation();
              alert("Mật khẩu xác nhận không khớp!");
              return;
            }

            if (newPassword && newPassword.length < 8) {
              event.preventDefault();
              event.stopPropagation();
              alert("Mật khẩu mới phải có ít nhất 8 ký tự!");
              return;
            }

            if (!form.checkValidity()) {
              event.preventDefault();
              event.stopPropagation();
            } else {
              event.preventDefault();
              alert("Thông tin khách hàng đã được cập nhật!");
              form.reset();
            }
            form.classList.add("was-validated");
          },
          false
        );
      });
    },
    false
  );
})();
