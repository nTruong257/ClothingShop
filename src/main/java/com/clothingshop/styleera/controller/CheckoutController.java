package com.clothingshop.styleera.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

    // Nếu bạn vô tình chạy GET (gõ URL trực tiếp), nó sẽ báo lỗi như bạn thấy.
    // Vì vậy mọi logic phải nằm ở doPost
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Lấy đúng tham số từ các thẻ input name="..." ở trên
        String name = request.getParameter("productName");
        String image = request.getParameter("productImage");
        String size = request.getParameter("selectedSize");
        String color = request.getParameter("selectedColor");
        String priceStr = request.getParameter("productPrice");
        String qtyStr = request.getParameter("quantity");

        // Trong doPost của CheckoutController
        // CheckoutController.java
        double price = Double.parseDouble(request.getParameter("productPrice")); // Lấy từ input hidden
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        double subTotal = price * quantity;
        double shipping = 30000.0; // Phí ship cố định theo database hoặc logic riêng
        double total = subTotal + shipping;

        // Gửi sang checkout.jsp
        request.setAttribute("cName", name);
        request.setAttribute("cImage", image);
        request.setAttribute("cSize", size);
        request.setAttribute("cColor", color);
        request.setAttribute("cQty", quantity);
        request.setAttribute("cSubTotal", subTotal);
        request.setAttribute("cShipping", shipping);
        request.setAttribute("cTotal", subTotal + shipping);

        request.getRequestDispatcher("/views/pages/checkout.jsp").forward(request, response);
    }
    }