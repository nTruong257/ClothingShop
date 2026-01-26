package com.clothingshop.styleera.controller;

import com.clothingshop.styleera.dao.UserDAO;
import com.clothingshop.styleera.model.User;
import com.clothingshop.styleera.service.EmailService;
import com.clothingshop.styleera.util.PasswordUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("views/pages/register.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String confirmPass = request.getParameter("confirmPassword");
        String phone = request.getParameter("phone");

        UserDAO userDAO = new UserDAO();

        // 1. Validation
        if (!pass.equals(confirmPass)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("views/pages/register.jsp").forward(request, response);
            return;
        }
        if (userDAO.findByEmail(email) != null) {
            request.setAttribute("error", "Email này đã được sử dụng!");
            request.getRequestDispatcher("views/pages/register.jsp").forward(request, response);
            return;
        }

        // 2. Tạo OTP & User
        int randomPin = (int) (Math.random() * 900000) + 100000;
        String otpCode = String.valueOf(randomPin);

        User user = new User();
        user.setUser_name(name);
        user.setEmail(email);
        user.setPassword_hash(PasswordUtils.hashPassword(pass));
        user.setPhone(phone);
        user.setEnabled(0);

        userDAO.registerUser(user, otpCode);

        // 3. Gửi Email
        new Thread(() -> {
            new EmailService().sendOtpEmail(email, otpCode);
        }).start();

        // 4. Chuyển hướng sang trang verify.jsp
        request.setAttribute("email", email);
        request.setAttribute("message", "Mã xác thực đã được gửi đến email của bạn.");
        request.getRequestDispatcher("views/pages/verify.jsp").forward(request, response);
    }
}