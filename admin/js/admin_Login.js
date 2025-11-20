document.getElementById("loginForm").addEventListener("submit", function (e) {
  e.preventDefault();
  alert("Đăng nhập thành công!");
  window.location.href = "admin-dashboard.html";
});
