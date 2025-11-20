document.getElementById("sidebarToggle").addEventListener("click", function () {
  document.querySelector(".admin-sidebar").classList.toggle("active");
});

function deleteProduct(id) {
  if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này?")) {
    alert("Sản phẩm #" + id + " đã được xóa!");
  }
}

// Search functionality
document.getElementById("searchInput").addEventListener("keyup", function (e) {
  const searchTerm = e.target.value.toLowerCase();
  const rows = document.querySelectorAll("#productsTable tbody tr");
  rows.forEach((row) => {
    const text = row.textContent.toLowerCase();
    row.style.display = text.includes(searchTerm) ? "" : "none";
  });
});
