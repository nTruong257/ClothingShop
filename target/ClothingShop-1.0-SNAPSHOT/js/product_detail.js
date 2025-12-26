// --- 1. CÁC HÀM GỌI TRỰC TIẾP TỪ HTML (GLOBAL SCOPE) ---

function pickColor(element, colorValue) {
  const buttons = document.querySelectorAll('.color-choice');
  buttons.forEach(btn => {
    btn.style.backgroundColor = "";
    btn.style.color = "";
    btn.style.borderColor = "";
  });

  element.style.backgroundColor = "#ff6666"; // Màu đỏ cam
  element.style.color = "white";
  element.style.borderColor = "#ff6666";

  const hiddenInput = document.getElementById('finalColor');
  if (hiddenInput) hiddenInput.value = colorValue;
}

function changeImage(imagePath) {
  const mainImg = document.getElementById('mainImage');
  if (mainImg) mainImg.src = imagePath;
}

// --- 2. CÁC SỰ KIỆN CHẠY KHI TRANG LOAD XONG ---

document.addEventListener("DOMContentLoaded", () => {
  // Xử lý tăng giảm số lượng
  const btnIncrease = document.getElementById('btn-increase');
  const btnDecrease = document.getElementById('btn-decrease');
  const quantityInput = document.getElementById('quantity');

  if (btnIncrease && btnDecrease && quantityInput) {
    btnIncrease.addEventListener('click', () => {
      quantityInput.value = parseInt(quantityInput.value) + 1;
    });
    btnDecrease.addEventListener('click', () => {
      let val = parseInt(quantityInput.value);
      if (val > 1) quantityInput.value = val - 1;
    });
  }

  // Xử lý chọn Size
  const sizeLabels = document.querySelectorAll('.size-label');
  const finalSize = document.getElementById('finalSize');
  sizeLabels.forEach(label => {
    label.addEventListener('click', () => {
      sizeLabels.forEach(l => l.classList.remove('active'));
      label.classList.add('active');
      if (finalSize) finalSize.value = label.innerText.trim();
    });
  });

  // Xử lý Tabs
  const tabs = document.querySelectorAll(".nav-link");
  tabs.forEach(tab => {
    tab.addEventListener("click", e => {
      e.preventDefault();
      const targetId = tab.getAttribute("data-tab");
      document.querySelectorAll(".tab-pane").forEach(c => c.classList.remove("active"));
      tabs.forEach(t => t.classList.remove("active"));

      tab.classList.add("active");
      const targetContent = document.getElementById(targetId);
      if (targetContent) targetContent.classList.add("active");
    });
  });
});