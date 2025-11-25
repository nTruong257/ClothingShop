const mainImage = document.getElementById('mainImage');
const thumbnails = document.querySelectorAll('.product_thumbs img');

thumbnails.forEach(img => {
  img.addEventListener('click', () => {
    // Thay đổi src ảnh lớn
    mainImage.src = img.src;

    // Xóa class active ở tất cả ảnh nhỏ
    thumbnails.forEach(i => i.classList.remove('active'));

    // Thêm class active cho ảnh nhỏ vừa click
    img.classList.add('active');
  });
});


document.addEventListener("DOMContentLoaded", () => {
  const tabs = document.querySelectorAll(".nav-link");
  const contents = document.querySelectorAll(".tab-pane");

  tabs.forEach(tab => {
    tab.addEventListener("click", e => {
      e.preventDefault();

      // Bỏ active khỏi tất cả tab
      tabs.forEach(t => t.classList.remove("active"));
      // Active tab hiện tại
      tab.classList.add("active");

      // Ẩn toàn bộ nội dung
      contents.forEach(c => c.classList.remove("active"));

      // Lấy id cần hiển thị
      const targetId = tab.getAttribute("data-tab");
      const targetContent = document.getElementById(targetId);

      // Hiện nội dung tương ứng
      if (targetContent) targetContent.classList.add("active");
    });
  });
});
const btnIncrease = document.getElementById('btn-increase');
const btnDecrease = document.getElementById('btn-decrease');
const quantityInput = document.getElementById('quantity');

btnIncrease.addEventListener('click', () => {
  let currentValue = parseInt(quantityInput.value);
  quantityInput.value = currentValue + 1;
});

btnDecrease.addEventListener('click', () => {
  let currentValue = parseInt(quantityInput.value);
  if (currentValue > 1) {
    quantityInput.value = currentValue - 1;
  }
});
const sizeLabels = document.querySelectorAll('.product_detail_size label');

sizeLabels.forEach(label => {
  label.addEventListener('click', () => {
    // Xóa class active ở tất cả label
    sizeLabels.forEach(l => l.classList.remove('active'));
    // Thêm class active cho label vừa click
    label.classList.add('active');
  });
});



