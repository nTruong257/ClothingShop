package com.clothingshop.styleera.controller;

import com.clothingshop.styleera.model.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UpdateCart", value = "/update-cart")
public class UpdateCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int variantId = Integer.parseInt(request.getParameter("variantId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String action = request.getParameter("action");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if(cart == null){
            response.sendRedirect("cart.jsp");
            return;
        }
        if ("increase".equals(action)) {
            quantity++;
        } else if ("decrease".equals(action)) {
            quantity--;
        }
        cart.updateItem(variantId, quantity);

        request.getSession().setAttribute("cart", cart);
        response.sendRedirect(request.getContextPath() + "/views/pages/cart.jsp");

    }
}