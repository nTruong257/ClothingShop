document.getElementById("sidebarToggle").addEventListener("click", function () {
  document.querySelector(".admin-sidebar").classList.toggle("active");
});

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
            if (!form.checkValidity()) {
              event.preventDefault();
              event.stopPropagation();
            } else {
              event.preventDefault();
              alert("Sản phẩm đã được thêm thành công!");
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
