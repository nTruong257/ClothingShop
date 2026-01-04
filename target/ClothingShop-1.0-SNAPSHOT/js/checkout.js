// --- PHẦN 1: XỬ LÝ CHỌN QUẬN/HUYỆN ---
const districts = {
  "43": [
    {text: "Quận 1"}, {text: "Quận 3"}, {text: "Quận 4"}, {text: "Quận 5"},
    {text: "Quận 6"}, {text: "Quận 7"}, {text: "Quận 8"}, {text: "Quận 10"},
    {text: "Quận 11"}, {text: "Quận 12"}, {text: "Quận Tân Bình"},
    {text: "Quận Tân Phú"}, {text: "Quận Bình Thạnh"}, {text: "Quận Bình Tân"},
    {text: "Quận Phú Nhuận"}
  ],
  "44": [
    {text: "Quận Gò Vấp"}, {text: "TP Thủ Đức (Quận 2, 9, Thủ Đức)"},
    {text: "Huyện Củ Chi"}, {text: "Huyện Bình Chánh"}, {text: "Huyện Nhà Bè"},
    {text: "Huyện Cần Giờ"}, {text: "Huyện Hóc Môn"}
  ]
};

const citySelect = document.getElementById("input-shipping-zone");
const districtSelect = document.getElementById("input-shipping-district");

function resetDistricts() {
  if (districtSelect) {
    districtSelect.innerHTML = '<option value="0">Vui lòng chọn quận/huyện</option>';
    districtSelect.disabled = true;
  }
}

// Khởi tạo sự kiện thay đổi tỉnh thành
if (citySelect && districtSelect) {
  resetDistricts();

  citySelect.addEventListener("change", function () {
    const val = String(this.value);
    resetDistricts();

    if (val !== "0" && districts[val]) {
      districts[val].forEach(d => {
        const option = document.createElement("option");
        option.value = d.text; // Gửi text về Servlet để hiển thị đúng tên quận
        option.textContent = d.text;
        districtSelect.appendChild(option);
      });
      districtSelect.disabled = false;
    }
  });
}

// --- PHẦN 2: XỬ LÝ MODAL (XEM ĐƠN HÀNG) ---
const modalBackdrop = document.getElementById('modalBackdrop');
const viewOrderBtn = document.getElementById('viewOrderBtn');

if(viewOrderBtn) {
  viewOrderBtn.addEventListener('click', () => {
    if(modalBackdrop) modalBackdrop.classList.add('show');
  });
}

function closeModal() {
  if(modalBackdrop) modalBackdrop.classList.remove('show');
}

// --- PHẦN 3: XÁC NHẬN ĐƠN HÀNG (JQUERY) ---
$(document).ready(function() {
  $('#validate_order').on('click', function() {
    // 1. Lấy phương thức thanh toán
    let payment = $('input[name="payment_method"]:checked').val();
    if (!payment) {
      alert("Vui lòng chọn phương thức thanh toán!");
      return;
    }

    // 2. Gán vào input ẩn
    $('#hPaymentMethod').val(payment);

    // 3. Kiểm tra các trường bắt buộc
    let name = $('#input-shipping-firstname').val();
    let phone = $('#input-shipping-phone').val();
    let zone = $('#input-shipping-zone').val();

    if (name === "" || phone === "" || zone === "0") {
      alert("Vui lòng nhập đầy đủ Họ tên, Số điện thoại và Tỉnh thành!");
      return;
    }

    // 4. Gửi form
    console.log("Dữ liệu hợp lệ, đang gửi đơn hàng...");
    $('#form-shipping-address').submit();
  });
});