
document.addEventListener('DOMContentLoaded', function () {
    const quantityItems = document.querySelectorAll('.quantity-item');

    quantityItems.forEach(form => {
        const decreaseBtn = form.querySelector('button[name="action"][value="decrease"]');
        const increaseBtn = form.querySelector('button[name="action"][value="increase"]');
        const input = form.querySelector('input[type="text"][name="quantity"]');

        if (!decreaseBtn || !increaseBtn || !input) {
            return;
        }

        // Chỉ để tránh lỗi JS; còn tăng/giảm vẫn submit form như hiện tại
        input.addEventListener('change', function () {
            let currValue = parseInt(this.value, 10) || 1;
            if (currValue < 1) currValue = 1;
            this.value = currValue;
        });
    });
});