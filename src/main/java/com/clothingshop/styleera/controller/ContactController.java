package com.clothingshop.styleera.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ContactController", value = "/ContactController")
public class ContactController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mess = request.getParameter("message");

        boolean valid = true;
        String nameRegex = "^[a-zA-ZÀ-ỹ\\s]+$";
        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";

        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("nameError", "Vui lòng nhập tên");
            valid = false;
        }else if (!name.matches(nameRegex)) {
            request.setAttribute("nameError", "Lỗi, Vui lòng nhập tên chỉ được chứa chữ cái!");
            valid = false;
        }

        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("emailError", "Vui lòng nhập email");
            valid = false;
        } else if (!email.matches(emailRegex)) {
            request.setAttribute(
                    "emailError",
                    "Email không hợp lệ! Vui lòng nhập đúng định dạng (vd: example@gmail.com)"
            );
            valid = false;
        }

        if (mess == null || mess.trim().length() < 10) {
            request.setAttribute("messageError",
                    "Nội dung tin nhắn phải có ít nhất 10 ký tự!");
            valid = false;
        }

        if (valid) {
            request.setAttribute("success", true);
        }

        request.getRequestDispatcher("/views/pages/contact.jsp")
                .forward(request, response);

    }
}