document.addEventListener('DOMContentLoaded', function () {
  const districts = {
    "43": [
      { value: 47, text: "Quận 1" },
      { value: 48, text: "Quận 3" },
      { value: 49, text: "Quận 4" },
      { value: 50, text: "Quận 5" },
      { value: 51, text: "Quận 6" },
      { value: 52, text: "Quận 7" },
      { value: 53, text: "Quận 8" },
      { value: 54, text: "Quận 10" },
      { value: 55, text: "Quận 11" },
      { value: 56, text: "Quận 12" },
      { value: 57, text: "Quận Tân Bình" },
      { value: 58, text: "Quận Tân Phú" },
      { value: 59, text: "Quận Bình Thạnh" },
      { value: 60, text: "Quận Bình Tân" },
      { value: 61, text: "Quận Phú Nhuận" }
    ],
    "44": [
      { value: 62, text: "Quận Gò Vấp" },
      { value: 63, text: "TP Thủ Đức (Quận 2, 9, Thủ Đức)" },
      { value: 64, text: "Huyện Củ Chi" },
      { value: 65, text: "Huyện Bình Chánh" },
      { value: 66, text: "Huyện Nhà Bè" },
      { value: 67, text: "Huyện Cần Giờ" },
      { value: 68, text: "Huyện Hóc Môn" }
    ]
  };

  const citySelect = document.getElementById("input-shipping-zone");
  const districtSelect = document.getElementById("input-shipping-custom-field-30");

  if (!citySelect || !districtSelect) {
    console.error("Không tìm thấy element citySelect hoặc districtSelect. Kiểm tra lại id trong HTML.");
    return;
  }

  function resetDistricts() {
    districtSelect.innerHTML = '<option value="0">Vui lòng chọn quận/huyện</option>';
    districtSelect.disabled = true;
  }

  // khởi tạo mặc định
  resetDistricts();

  citySelect.addEventListener("change", function () {
    const val = String(this.value);
    resetDistricts();

    if (val === "0" || !districts[val]) {
      // không có danh sách — giữ disabled
      return;
    }

    // thêm option
    const list = districts[val];
    list.forEach(d => {
      const option = document.createElement("option");
      option.value = d.text; // Sửa thành d.text để gửi CHỮ (ví dụ: "Quận 1")
      option.textContent = d.text;
      districtSelect.appendChild(option);
    });

    districtSelect.disabled = false;
  });
});
// Thay thế đoạn xử lý click cũ bằng đoạn này
const btnConfirm = document.getElementById("validate_order");
if (btnConfirm) {
  btnConfirm.onclick = function() {
    console.log("Nút đã được bấm!");

    // 1. Lấy phương thức thanh toán từ cột phải
    const paymentRadio = document.querySelector('input[name="payment_method"]:checked');
    if (!paymentRadio) {
      alert("Vui lòng chọn phương thức thanh toán!");
      return;
    }

    // 2. Gán giá trị vào input ẩn ở form trái
    const hPayment = document.getElementById("hPaymentMethod");
    if (hPayment) hPayment.value = paymentRadio.value;

    // 3. Kiểm tra các trường bắt buộc ở form trái
    const nameInput = document.getElementById("input-shipping-firstname");
    if (!nameInput || nameInput.value.trim() === "") {
      alert("Vui lòng nhập họ tên khách hàng!");
      return;
    }

    // 4. LỆNH QUAN TRỌNG: Gửi form bên trái
    const mainForm = document.getElementById("form-shipping-address");
    if (mainForm) {
      console.log("Đang gửi form...");
      mainForm.submit(); // Nếu dòng này chạy, trang SẼ PHẢI LOAD SANG TRANG MỚI
    } else {
      console.error("Không tìm thấy form với id: form-shipping-address");
    }
  };
}
const modalBackdrop = document.getElementById('modalBackdrop');
const viewOrderBtn = document.getElementById('viewOrderBtn');
const trackBtn = document.getElementById('trackBtn');
const homeBtn = document.getElementById('homeBtn');
// Demo: open modal when clicking "Xem đơn hàng"
viewOrderBtn.addEventListener('click', () => openModal());
trackBtn.addEventListener('click', () => location.href = '/orders/985723');
homeBtn.addEventListener('click', () => location.href = '/');

function openModal() {
  modalBackdrop.classList.add('show');
  modalBackdrop.setAttribute('aria-hidden', 'false');
}

function closeModal() {
  modalBackdrop.classList.remove('show');
  modalBackdrop.setAttribute('aria-hidden', 'true');
}

(function populateFromQuery() {
  const params = new URLSearchParams(location.search);
  if (params.has('order')) {
    const id = params.get('order');
    document.getElementById('orderId').textContent = 'Mã đơn hàng: #' + id;
    document.getElementById('modalOrder').textContent = '#' + id;
  }
  if (params.has('name')) document.getElementById('shipName').textContent = params.get('name');
  if (params.has('phone')) document.getElementById('shipPhone').textContent = params.get('phone');
  if (params.has('addr')) document.getElementById('shipAddress').textContent = params.get('addr');
  if (params.has('eta')) document.getElementById('shipETA').textContent = params.get('eta');
  if (params.has('pay')) document.getElementById('payMethod').textContent = params.get('pay');
})();

