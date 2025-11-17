 const mainImage = document.getElementById('mainImage');
  const thumbnails = document.querySelectorAll('.row_bottom_detail img');

  thumbnails.forEach(img => {
    img.addEventListener('click', () => {
      // Đổi ảnh chính thành ảnh nhỏ vừa click
      mainImage.src = img.src;

      // Xóa class "active" ở các ảnh nhỏ khác
      thumbnails.forEach(i => i.classList.remove('active'));

      // Thêm class "active" vào ảnh vừa được chọn
      img.classList.add('active');
    });
  });
  const imgs = document.querySelectorAll('.row_bottom_detail img');
imgs.forEach(img => {
  img.style.objectFit = 'cover';
  img.style.objectPosition = 'top'; // có thể đổi sang 'center' hoặc 'bottom'
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


