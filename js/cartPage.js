document.addEventListener('DOMContentLoaded', function (){
    const quantityItems = document.querySelectorAll('.quantity-item')
    quantityItems.forEach(item => {
        const descreaseBtn = item.querySelector('.fa-less-than');
        const increaseBtn = item.querySelector('.fa-greater-than');
        const input = item.querySelector('input[type="text"]')

        descreaseBtn.addEventListener('click', function () {
            const currValue = parseInt(input.value) || 1;
            if(currValue > 1){
                input.value = currValue - 1;
            }
        });

        increaseBtn.addEventListener('click', function () {
            const currValue = parseInt(input.value) || 1;
            input.value = currValue + 1;
        });
        input.addEventListener('change', function () {
            let currValue = parseInt(this.value) || 1;
            if (currValue < 1) {
                currValue = 1;
            }
            this.value = currValue;
        });

    })
})

