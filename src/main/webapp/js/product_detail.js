// webapp/js/product_detail.js

// 1. Hàm chọn màu gọi từ onclick trong JSP
function pickColor(element, colorValue) {
  const buttons = document.querySelectorAll('.color-choice');
  buttons.forEach(btn => {
    btn.style.backgroundColor = "";
    btn.style.color = "";
    btn.style.borderColor = "";
  });

  // Highlight nút màu đỏ cam #ff6666
  element.style.backgroundColor = "#ff6666";
  element.style.color = "white";
  element.style.borderColor = "#ff6666";

  // Lưu vào input hidden
  const hiddenColor = document.getElementById('finalColor');
  if (hiddenColor) hiddenColor.value = colorValue;
}

// 2. Các sự kiện khác bọc trong DOMContentLoaded để tránh lỗi null
document.addEventListener("DOMContentLoaded", () => {
  // Xử lý chọn Size (Label)
  const sizeLabels = document.querySelectorAll('.size-label');
  const finalSize = document.getElementById('finalSize');

  sizeLabels.forEach(label => {
    label.addEventListener('click', () => {
      sizeLabels.forEach(l => l.classList.remove('active'));
      label.classList.add('active');
      if (finalSize) finalSize.value = label.innerText.trim();
    });
  });

  // Xử lý tăng giảm số lượng
  const qtyInput = document.getElementById('quantity');
  const btnInc = document.getElementById('btn-increase');
  const btnDec = document.getElementById('btn-decrease');

  if (btnInc && btnDec && qtyInput) {
    btnInc.onclick = () => qtyInput.value = parseInt(qtyInput.value) + 1;
    btnDec.onclick = () => {
      let v = parseInt(qtyInput.value);
      if (v > 1) qtyInput.value = v - 1;
    };
  }
});