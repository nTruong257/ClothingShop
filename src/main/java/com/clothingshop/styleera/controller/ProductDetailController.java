package com.clothingshop.styleera.controller;

import com.clothingshop.styleera.model.Product;
import com.clothingshop.styleera.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Product_DetailController", value = "/Product_DetailController")
public class ProductDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductService productService = new ProductService();
        Product product = productService.findById(productId);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/views/pages/product_detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}