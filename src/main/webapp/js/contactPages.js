
document.addEventListener('DOMContentLoaded', function() {
    const submitButton = document.querySelector('.mybutton');
    const nameInput = document.getElementById('userName');
    const emailInput = document.getElementById('userEmail');
    const messageInput = document.getElementById('userMessage');

    function validateName(name) {
        const trimmedName = name.trim();
        if (trimmedName === '') {
            return { valid: false, message: 'Vui lòng nhập tên của bạn!' };
        }
        if (trimmedName.length < 2) {
            return { valid: false, message: 'Tên phải có ít nhất 2 ký tự!' };
        }
        if (trimmedName.length > 50) {
            return { valid: false, message: 'Tên không được vượt quá 50 ký tự!' };
        }
        const nameRegex = /^[a-zA-ZÀ-ỹ\s]+$/;
        if (!nameRegex.test(trimmedName)) {
            return { valid: false, message: 'Tên chỉ được chứa chữ cái!' };
        }
        return { valid: true, message: '' };
    }

    function validateEmail(email) {
        const trimmedEmail = email.trim();
        if (trimmedEmail === '') {
            return { valid: false, message: 'Vui lòng nhập email!' };
        }
        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!emailRegex.test(trimmedEmail)) {
            return { valid: false, message: 'Email không hợp lệ! Vui lòng nhập đúng định dạng (vd: example@gmail.com)' };
        }
        return { valid: true, message: '' };
    }
    function validateMessage(message) {
        const trimmedMessage = message.trim();
        if (trimmedMessage === '') {
            return { valid: false, message: 'Vui lòng nhập nội dung tin nhắn!' };
        }
        if (trimmedMessage.length < 10) {
            return { valid: false, message: 'Nội dung tin nhắn phải có ít nhất 10 ký tự!' };
        }
        if (trimmedMessage.length > 500) {
            return { valid: false, message: 'Nội dung tin nhắn không được vượt quá 500 ký tự!' };
        }
        return { valid: true, message: '' };
    }

    function showError(input, message) {
        removeError(input);
        input.classList.add('error-input');
        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.textContent = message;
        input.parentElement.appendChild(errorDiv);
    }

    function removeError(input) {
        input.classList.remove('error-input');
        const errorDiv = input.parentElement.querySelector('.error-message');
        if (errorDiv) {
            errorDiv.remove();
        }
    }

    function showSuccessMessage() {
        const successDiv = document.createElement('div');
        successDiv.className = 'success-message';
        successDiv.innerHTML = ' <h5> <i class="fas fa-check-circle"></i> Gửi thông tin thành công! Chúng tôi sẽ liên hệ với bạn sớm.</h5> ';
        const form = document.querySelector('.contact_form');
        form.insertBefore(successDiv, form.firstChild);
        setTimeout(() => {
            successDiv.remove();
        }, 2000);
    }

    submitButton.addEventListener('click', function(e) {
        e.preventDefault();

        removeError(nameInput);
        removeError(emailInput);
        removeError(messageInput);

        const name = nameInput.value;
        const email = emailInput.value;
        const message = messageInput.value;

        const nameValidation = validateName(name);
        const emailValidation = validateEmail(email);
        const messageValidation = validateMessage(message);

        let isValid = true;

        if (!nameValidation.valid) {
            showError(nameInput, nameValidation.message);
            isValid = false;
        }

        if (!emailValidation.valid) {
            showError(emailInput, emailValidation.message);
            isValid = false;
        }

        if (!messageValidation.valid) {
            showError(messageInput, messageValidation.message);
            isValid = false;
        }

        if (isValid) {
            showSuccessMessage();
            nameInput.value = '';
            emailInput.value = '';
            messageInput.value = '';
            console.log('Form data:', { name, email, message });

        }
    });
});