package com.clothingshop.styleera.controller;

import com.clothingshop.styleera.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/verify")
public class VerifyController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/pages/verify.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String inputOtp = request.getParameter("otp");
        HttpSession session = request.getSession();

        UserDAO userDAO = new UserDAO();

        if (userDAO.checkOtp(email, inputOtp)) {
            // Kiểm tra xem đang ở luồng nào
            String verifyType = (String) session.getAttribute("verifyType");

            if ("RESET_PASSWORD".equals(verifyType)) {
                // == TRƯỜNG HỢP QUÊN MẬT KHẨU ==
                // OTP đúng -> Cho phép qua trang đổi mật khẩu
                response.sendRedirect(request.getContextPath() + "/reset-password");
            } else {
                // == TRƯỜNG HỢP ĐĂNG KÝ MỚI (Mặc định) ==
                userDAO.activeUser(email);
                request.setAttribute("message", "Kích hoạt thành công! Vui lòng đăng nhập.");
                request.getRequestDispatcher("/login").forward(request, response);
            }
        } else {
            // OTP Sai
            request.setAttribute("error", "Mã xác thực không chính xác!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/verify").forward(request, response);
        }
    }
}