document.addEventListener('DOMContentLoaded', function () {
    const cancelButton = document.querySelector('.btn.btn-danger');

    if (cancelButton) {
        cancelButton.addEventListener('click', function (e) {
            e.preventDefault();
            const modalElement = document.getElementById('cancelSuccessModal');
            const cancelSuccessModal = new bootstrap.Modal(modalElement);
            cancelSuccessModal.show();
        });
    }
});