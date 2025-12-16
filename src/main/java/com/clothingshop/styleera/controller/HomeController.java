package com.clothingshop.styleera.controller;
import com.clothingshop.styleera.model.Product;
import com.clothingshop.styleera.service.ServiceProduct;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = {"/home", ""})
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServiceProduct serviceProduct = new ServiceProduct();

        // 1. Lấy sản phẩm MỚI (New Arrivals)
        List<Product> newArrivals = serviceProduct.findNewArrivals();

        // 2. Lấy sản phẩm BÁN CHẠY (Best Sellers)
        List<Product> bestSellers = serviceProduct.findBestSellers();

        // 3. Đẩy dữ liệu sang JSP
        request.setAttribute("newArrivals", newArrivals);
        request.setAttribute("bestSellers", bestSellers); // Quan trọng: biến này dùng cho phần Bán chạy

        request.getRequestDispatcher("/views/pages/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}