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
      option.value = d.value;
      option.textContent = d.text;
      districtSelect.appendChild(option);
    });

    districtSelect.disabled = false;
  });
});
