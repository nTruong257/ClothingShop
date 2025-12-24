package com.clothingshop.styleera.controller;

import com.clothingshop.styleera.model.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "RemoveItem", value = "/del-item")
public class RemoveItem extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int variantId = Integer.parseInt(request.getParameter("variantId"));
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if(cart == null){
            cart = new Cart();
            request.getSession().setAttribute("cart",cart);
            return;
        }
        cart.removeItem(variantId);
        request.getSession().setAttribute("cart",cart);
        response.sendRedirect(request.getContextPath() + "/views/pages/cart.jsp");
    }
}