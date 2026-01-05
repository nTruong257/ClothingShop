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
        HttpSession session = request.getSession();

        UserDAO userDAO = new UserDAO();

        if (userDAO.checkOtp(email, inputOtp)) {
            // Kiểm tra xem đang ở luồng nào
            String verifyType = (String) session.getAttribute("verifyType");

            if ("RESET_PASSWORD".equals(verifyType)) {
                // == TRƯỜNG HỢP QUÊN MẬT KHẨU ==
                // OTP đúng -> Cho phép qua trang đổi mật khẩu
                response.sendRedirect(request.getContextPath() + "/views/pages/reset-password.jsp");
            } else {
                // == TRƯỜNG HỢP ĐĂNG KÝ MỚI (Mặc định) ==
                userDAO.activeUser(email);
                request.setAttribute("message", "Kích hoạt thành công! Vui lòng đăng nhập.");
                request.getRequestDispatcher("views/pages/login.jsp").forward(request, response);
            }
        } else {
            // OTP Sai
            request.setAttribute("error", "Mã xác thực không chính xác!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("views/pages/verify.jsp").forward(request, response);
        }
    }
}