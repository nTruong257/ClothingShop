package com.clothingshop.styleera.controller;

import com.clothingshop.styleera.model.Cart;
import com.clothingshop.styleera.model.CartItem;
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
        response.setContentType("application/json;charset=UTF-8");

        int variantId = Integer.parseInt(request.getParameter("variantId"));
        String action = request.getParameter("action");

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            response.getWriter().print("{\"status\":\"error\"}");
            return;
        }

        CartItem item = cart.getItem()
                .stream()
                .filter(i -> i.getVariant().getVariantId() == variantId)
                .findFirst()
                .orElse(null);

        if (item == null) {
            response.getWriter().print("{\"status\":\"error\"}");
            return;
        }

        int quantity = item.getQuantity();
        if ("increase".equals(action)) {
            quantity++;
        } else if ("decrease".equals(action)) {
            quantity--;
            if (quantity < 1) {
                quantity = 1;
            }
        }

        cart.updateItem(variantId, quantity);

        double itemTotal = quantity * item.getVariant().getProduct().getPrice();
        double cartTotal = cart.total();

        response.getWriter().print(
                "{"
                        + "\"status\":\"success\","
                        + "\"quantity\":" + quantity + ","
                        + "\"itemTotal\":" + itemTotal + ","
                        + "\"totalQuantity\":" + cart.getTotalQuantity() + ","
                        + "\"cartTotal\":" + cartTotal
                        + "}"
        );

    }
}