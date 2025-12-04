document.getElementById("sidebarToggle").addEventListener("click", function () {
    document.querySelector(".admin-sidebar").classList.toggle("active");
});

function getProducts() {
    const products = localStorage.getItem("products");
    return products ? JSON.parse(products) : [];
}

function saveProducts(products) {
    localStorage.setItem("products", JSON.stringify(products));
}

document.addEventListener("DOMContentLoaded", function () {
    const urlParams = new URLSearchParams(window.location.search);
    const productId = urlParams.get("id");

    if (productId) {
        document.querySelector(".page-title").textContent = "Chỉnh Sửa Sản Phẩm";

        const products = getProducts();
        const product = products.find((p) => p.id === productId);

        if (product) {
            fillProductForm(product, productId);
        }
    }

    const productForm = document.getElementById("productForm");
    if (productForm) {
        productForm.addEventListener("submit", function (e) {
            e.preventDefault();

            if (!this.checkValidity()) {
                e.stopPropagation();
                this.classList.add("was-validated");
                return;
            }

            const formData = {
                name: document.querySelector('input[placeholder="Nhập tên sản phẩm"]')
                    .value,
                category: document.querySelectorAll("select")[0].value,
                subcategory: document.querySelectorAll("select")[1].value,
                description: document.querySelector("textarea").value,
                price: parseInt(
                    document.querySelectorAll('input[type="number"]')[0].value
                ),
                quantity: parseInt(
                    document.querySelectorAll('input[type="number"]')[1].value
                ),
                status:
                    document.querySelectorAll("select")[2].value === "1"
                        ? "active"
                        : "outofstock",
            };

            // Xử lý ảnh (lấy link ảnh hoặc giữ ảnh cũ)
            let imageUrl = product?.image || "../images/default-product.png";

            console.log("Product Data:", formData);

            let products = getProducts();

            if (productId) {
                const productIndex = products.findIndex((p) => p.id === productId);
                if (productIndex !== -1) {
                    products[productIndex] = {
                        ...products[productIndex],
                        ...formData,
                        image: imageUrl,
                    };
                    alert("Cập nhật sản phẩm thành công!");
                }
            } else {
                const newId = String(
                    Math.max(...products.map((p) => parseInt(p.id))) + 1
                ).padStart(3, "0");

                const newProduct = {
                    id: newId,
                    ...formData,
                    image: imageUrl,
                    createdDate: new Date().toISOString().split("T")[0],
                };

                products.push(newProduct);
                alert("Thêm sản phẩm thành công!");
            }

            saveProducts(products);
            this.reset();
            this.classList.remove("was-validated");

            setTimeout(() => {
                window.location.href = "admin-products.jsp";
            }, 500);
        });
    }

    const productImages = document.getElementById("productImages");
    if (productImages) {
        productImages.addEventListener("change", function (e) {
            const imgPreview = document.getElementById("imgPreview");
            imgPreview.innerHTML = "";

            Array.from(this.files).forEach((file) => {
                const reader = new FileReader();

                reader.onload = function (event) {
                    const img = document.createElement("img");
                    img.src = event.target.result;
                    img.style.maxWidth = "100%";
                    img.style.maxHeight = "150px";
                    img.style.borderRadius = "5px";

                    const div = document.createElement("div");
                    div.appendChild(img);

                    imgPreview.appendChild(div);
                };

                reader.readAsDataURL(file);
            });
        });
    }
});

// Fill form data khi edit
function fillProductForm(product, productId) {
    const inputs = document.querySelectorAll(
        "#productForm input, #productForm select, #productForm textarea"
    );

    inputs.forEach((input) => {
        if (input.placeholder === "Nhập tên sản phẩm") {
            input.value = product.name;
        } else if (input.placeholder === "Nhập mô tả chi tiết sản phẩm") {
            input.value = product.description;
        }

        // Category select
        if (
            input.name === "category" ||
            (input.tagName === "SELECT" && inputs.indexOf(input) === 0)
        ) {
            input.value = product.category;
        }

        // Subcategory select
        if (
            input.name === "subcategory" ||
            (input.tagName === "SELECT" && inputs.indexOf(input) === 1)
        ) {
            input.value = product.subcategory;
        }

        // Price
        if (input.type === "number" && inputs.indexOf(input) === 0) {
            input.value = product.price;
        }

        // Quantity
        if (input.type === "number" && inputs.indexOf(input) === 1) {
            input.value = product.quantity;
        }

        // Status
        if (input.tagName === "SELECT" && inputs.indexOf(input) === 2) {
            input.value = product.status === "active" ? "1" : "0";
        }
    });
}

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
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
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
