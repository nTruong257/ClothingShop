package com.clothingshop.styleera.controller.Admin;

import com.clothingshop.styleera.dao.ProductDAO;
import com.clothingshop.styleera.model.ParentCategory;
import com.clothingshop.styleera.model.Product;
import com.clothingshop.styleera.service.CategoryService;
import com.clothingshop.styleera.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCategoryController", urlPatterns = "/admin-category")
public class AdminCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryService categoryService = new CategoryService();
        List<ParentCategory> parentCategoryList = categoryService.getAllCategories();


        ProductDAO dao = new ProductDAO();

        request.setAttribute("parentCategoryList", parentCategoryList);
        request.getRequestDispatcher("admin/admin-category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}