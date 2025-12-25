package com.clothingshop.styleera.controller;

import com.clothingshop.styleera.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/verify-otp")
public class VerifyController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String inputOtp = request.getParameter("otp");

        UserDAO userDAO = new UserDAO();

        if (userDAO.checkOtp(email, inputOtp)) {
            // Đúng -> Kích hoạt -> Về trang LOGIN
            userDAO.activeUser(email);
            request.setAttribute("message", "Kích hoạt thành công! Vui lòng đăng nhập.");
            request.getRequestDispatcher("views/pages/login.jsp").forward(request, response);
        } else {
            // Sai -> Ở lại trang VERIFY
            request.setAttribute("error", "Mã xác thực không chính xác!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("views/pages/verify.jsp").forward(request, response);
        }
    }
}