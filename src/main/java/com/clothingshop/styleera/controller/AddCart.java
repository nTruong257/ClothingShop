package com.clothingshop.styleera.controller;

import com.clothingshop.styleera.model.Cart;
import com.clothingshop.styleera.model.Variants;
import com.clothingshop.styleera.service.ServiceVariant;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AddCart", value = "/addcart")
public class AddCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String variantIdRaw = request.getParameter("variantId");
        String quantityRaw  = request.getParameter("quantity");

        if (variantIdRaw == null || quantityRaw == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        int variantId;
        int quantity;

        try {
            variantId = Integer.parseInt(variantIdRaw);
            quantity = Integer.parseInt(quantityRaw);
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
            return;
        }

        if (quantity <= 0) {
            quantity = 1;
        }

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        ServiceVariant variantService = new ServiceVariant();
        Variants variant = variantService.getById(variantId);

        if (variant == null) {
            request.setAttribute("msg", "Sản phẩm không tồn tại");
            request.getRequestDispatcher("/views/pages/cart.jsp").forward(request, response);
            return;
        }

        cart.addItem(variant, quantity);
        session.setAttribute("cart", cart);

        // Quay lại trang trước
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer != null ? referer : "home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}