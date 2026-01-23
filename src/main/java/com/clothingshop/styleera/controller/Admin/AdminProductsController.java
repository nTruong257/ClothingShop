package com.clothingshop.styleera.controller.Admin;

import com.clothingshop.styleera.dao.ProductDAO;
import com.clothingshop.styleera.model.Product;
import com.clothingshop.styleera.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProductsController", urlPatterns = "/admin-products")
public class AdminProductsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = new ProductService();
        List<Product> productsAdmin = productService.findAll();
        if (productsAdmin == null) {
            productsAdmin = new java.util.ArrayList<>();
        }

        //lọc theo danh mục:
        String parent = request.getParameter("parent");
        ProductDAO dao = new ProductDAO();
        if(parent == null){
            productsAdmin = dao.findAll();
        }else if(parent != null && !parent.isEmpty()){
            productsAdmin = dao.filterParentCategory(parent);
        }else {
            productsAdmin = dao.findAll();
        }


        request.setAttribute("productsAdmin", productsAdmin);
        request.getRequestDispatcher("/admin/admin-products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}