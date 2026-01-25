package com.clothingshop.styleera.controller.Admin;

import com.clothingshop.styleera.dao.ProductDAO;
import com.clothingshop.styleera.model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminDashboardController", value = "/AdminDashboard")
public class AdminDashboardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        List<Product> bestSellers = productDAO.findBestSellersAdmin();

        request.setAttribute("bestSellers", bestSellers);
        request.getRequestDispatcher("/admin/admin-dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}