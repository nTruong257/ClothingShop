package com.clothingshop.styleera.controller;

import com.clothingshop.styleera.dao.UserDAO;
import com.clothingshop.styleera.util.PasswordUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/reset-password")
public class ResetPasswordController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("resetEmail");
        String verifyType = (String) session.getAttribute("verifyType");

        // Bảo mật: Nếu không phải đang trong luồng reset thì đá về login
        if (email == null || !"RESET_PASSWORD".equals(verifyType)) {
            response.sendRedirect("views/pages/login.jsp");
            return;
        }

        String newPass = request.getParameter("password"); // name ở JSP phải là password
        String confirmPass = request.getParameter("confirmPassword"); // name ở JSP

        if (!newPass.equals(confirmPass)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("/views/pages/reset-password.jsp").forward(request, response);
            return;
        }

        // Cập nhật mật khẩu mới
        UserDAO userDAO = new UserDAO();
        userDAO.updatePassword(email, PasswordUtils.hashPassword(newPass));

        // Xóa session reset để bảo mật
        session.removeAttribute("verifyType");
        session.removeAttribute("resetEmail");

        request.setAttribute("message", "Đổi mật khẩu thành công! Hãy đăng nhập lại.");
        request.getRequestDispatcher("/views/pages/login.jsp").forward(request, response);
    }
}