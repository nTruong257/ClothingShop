document.getElementById("sidebarToggle").addEventListener("click", function () {
  document.querySelector(".admin-sidebar").classList.toggle("active");
});

// ===== PRODUCT MANAGEMENT =====

// Khởi tạo dữ liệu mẫu từ localStorage
function initializeProducts() {
  const existingProducts = localStorage.getItem("products");
  if (!existingProducts) {
    const defaultProducts = [
      {
        id: "001",
        name: "Áo Khoác Nam",
        category: "nam",
        subcategory: "Áo Khoác Nam",
        description: "Áo khoác nam chất lượng cao",
        price: 350000,
        quantity: 45,
        status: "active",
        image: "../images/product_item_nam/1/1.1/aokhoac_nam.avif",
        createdDate: "2025-01-15",
      },
      {
        id: "002",
        name: "Đầm Nữ",
        category: "nu",
        subcategory: "Đầm Nữ",
        description: "Đầm nữ thanh lịch",
        price: 450000,
        quantity: 32,
        status: "active",
        image: "../images/product_item_women/6/6-1/trangphuc.png",
        createdDate: "2025-01-20",
      },
      {
        id: "003",
        name: "Quần Jean Nam",
        category: "nam",
        subcategory: "Quần Jean Nam",
        description: "Quần jean nam kinh điển",
        price: 280000,
        quantity: 0,
        status: "outofstock",
        image: "../images/product_item_nam/7/7.2/quanjeans_nam.webp",
        createdDate: "2025-01-25",
      },
      {
        id: "004",
        name: "Áo Sơ mi Nữ",
        category: "nu",
        subcategory: "Áo Sơ mi Nữ",
        description: "Áo sơ mi nữ cao cấp",
        price: 150000,
        quantity: 78,
        status: "active",
        image: "../images/product_item_women/4/4-5/trangphuc.png",
        createdDate: "2025-02-01",
      },
      {
        id: "005",
        name: "Áo Polo nam",
        category: "nam",
        subcategory: "Áo Polo nam",
        description: "Áo polo nam phong cách",
        price: 520000,
        quantity: 15,
        status: "active",
        image: "../images/product_item_nam/3/3.1/aopolo_nam.webp",
        createdDate: "2025-02-05",
      },
    ];
    localStorage.setItem("products", JSON.stringify(defaultProducts));
  }
}

// Lấy tất cả products từ localStorage
function getProducts() {
  const products = localStorage.getItem("products");
  return products ? JSON.parse(products) : [];
}

// Lưu products vào localStorage
function saveProducts(products) {
  localStorage.setItem("products", JSON.stringify(products));
}

// Load bảng sản phẩm từ localStorage
function loadProductTable() {
  const products = getProducts();
  const tbody = document.querySelector("#productsTable tbody");

  if (!tbody) return;

  tbody.innerHTML = "";

  products.forEach((product) => {
    const badgeClass = product.status === "active" ? "bg-success" : "bg-danger";
    const statusText = product.status === "active" ? "Hoạt Động" : "Hết Hàng";
    const quantityBadge =
      product.quantity > 0
        ? `<span class="badge bg-success">${product.quantity}</span>`
        : `<span class="badge bg-danger">0</span>`;

    const row = document.createElement("tr");
    row.innerHTML = `
      <td>
        <input type="checkbox" class="form-check-input" />
      </td>
      <td>#${product.id}</td>
      <td>
        <div class="d-flex align-items-center">
          <div class="product-img-wrapper me-3">
            <img src="${product.image}" alt="${
      product.name
    }" class="product-img" />
          </div>
          <div>
            <strong>${product.name}</strong>
          </div>
        </div>
      </td>
      <td><span class="badge bg-info">${
        product.category === "nam"
          ? "Nam"
          : product.category === "nu"
          ? "Nữ"
          : "Đồ Đôi"
      }</span></td>
      <td>
        <span class="badge bg-secondary text-white">${
          product.subcategory
        }</span>
      </td>
      <td>${product.price.toLocaleString("vi-VN")}đ</td>
      <td>${quantityBadge}</td>
      <td><span class="badge ${badgeClass}">${statusText}</span></td>
      <td>
        <a href="admin-form.html?id=${
          product.id
        }" class="btn btn-sm btn-warning" title="Chỉnh sửa">
          <i class="fas fa-edit"></i>
        </a>
        <button class="btn btn-sm btn-danger" title="Xóa" onclick="deleteProductFromTable('${
          product.id
        }')">
          <i class="fas fa-trash"></i>
        </button>
      </td>
    `;

    tbody.appendChild(row);
  });

  // Update total count
  const countSpan = document.querySelector(".card-header strong");
  if (countSpan) {
    countSpan.textContent = products.length;
  }
}

// Xóa sản phẩm từ bảng và localStorage
function deleteProductFromTable(productId) {
  if (confirm("Bạn chắc chắn muốn xóa sản phẩm này?")) {
    let products = getProducts();
    products = products.filter((p) => p.id !== productId);
    saveProducts(products);
    loadProductTable();
    alert("Sản phẩm đã được xóa!");
  }
}

// Tải products khi trang load
document.addEventListener("DOMContentLoaded", function () {
  initializeProducts();
  loadProductTable();
});

// Search functionality
const searchInput = document.getElementById("searchInput");
if (searchInput) {
  searchInput.addEventListener("keyup", function (e) {
    const searchTerm = e.target.value.toLowerCase();
    const rows = document.querySelectorAll("#productsTable tbody tr");
    rows.forEach((row) => {
      const text = row.textContent.toLowerCase();
      row.style.display = text.includes(searchTerm) ? "" : "none";
    });
  });
}

// ===== ADD PRODUCT FORM =====
const addProductForm = document.getElementById("addProductForm");
if (addProductForm) {
  addProductForm.addEventListener("submit", function (e) {
    e.preventDefault();

    if (!this.checkValidity()) {
      e.stopPropagation();
      this.classList.add("was-validated");
      return;
    }

    const products = getProducts();

    // Tạo ID mới (tăng từ ID cuối cùng)
    const lastProduct = products[products.length - 1];
    const lastNum = parseInt(lastProduct.id);
    const newId = String(lastNum + 1).padStart(3, "0");

    // Xử lý file upload
    const fileInput = document.getElementById("addProductImage");
    let imageData = "../images/default-product.png";

    if (fileInput && fileInput.files && fileInput.files.length > 0) {
      const file = fileInput.files[0];
      // Sử dụng FileReader để chuyển ảnh thành base64
      const reader = new FileReader();
      reader.onload = function (event) {
        const newProductData = {
          id: newId,
          name: document.getElementById("addProductName").value,
          category: document.getElementById("addCategory").value,
          subcategory: document.getElementById("addSubcategory").value,
          description: document.getElementById("addDescription").value,
          price: parseInt(document.getElementById("addPrice").value),
          quantity: parseInt(document.getElementById("addQuantity").value),
          status: document.getElementById("addStatus").value,
          image: event.target.result,
          createdDate: new Date().toISOString().split("T")[0],
        };

        // Lưu vào localStorage
        products.push(newProductData);
        saveProducts(products);

        // Reset form
        addProductForm.reset();
        addProductForm.classList.remove("was-validated");

        // Đóng modal
        const modal = bootstrap.Modal.getInstance(
          document.getElementById("addProductModal")
        );
        modal.hide();

        // Reload bảng
        loadProductTable();

        alert("Thêm sản phẩm thành công!");
      };
      reader.readAsDataURL(file);
    } else {
      // Nếu không có ảnh, dùng ảnh mặc định
      const newProductData = {
        id: newId,
        name: document.getElementById("addProductName").value,
        category: document.getElementById("addCategory").value,
        subcategory: document.getElementById("addSubcategory").value,
        description: document.getElementById("addDescription").value,
        price: parseInt(document.getElementById("addPrice").value),
        quantity: parseInt(document.getElementById("addQuantity").value),
        status: document.getElementById("addStatus").value,
        image: imageData,
        createdDate: new Date().toISOString().split("T")[0],
      };

      // Lưu vào localStorage
      products.push(newProductData);
      saveProducts(products);

      // Reset form
      this.reset();
      this.classList.remove("was-validated");

      // Đóng modal
      const modal = bootstrap.Modal.getInstance(
        document.getElementById("addProductModal")
      );
      modal.hide();

      // Reload bảng
      loadProductTable();

      alert("Thêm sản phẩm thành công!");
    }
  });
}

// Legacy function for backward compatibility
function deleteProduct(id) {
  deleteProductFromTable(id);
}
