package com.clothingshop.styleera.controller;

import java.util.List;
import com.clothingshop.styleera.model.Variants;
import com.clothingshop.styleera.model.Product;
import com.clothingshop.styleera.service.ServiceProduct;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Product_DetailController", value = "/Product_DetailController")
public class ProductDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            if (idParam == null) {
                response.sendRedirect("products");
                return;
            }

            int productId = Integer.parseInt(idParam);
            ServiceProduct serviceProduct = new ServiceProduct();

            // Lấy thông tin từ Service
            Product product = serviceProduct.findById(productId);
            List<String> imageList = serviceProduct.getImagesByProductId(productId);
            List<Variants> variantList = serviceProduct.getVariantsByProductId(productId);

            // Đẩy dữ liệu sang JSP
            request.setAttribute("product", product);
            request.setAttribute("imageList", imageList);
            request.setAttribute("variantList", variantList);

            request.getRequestDispatcher("/views/pages/product_detail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("products");
        }
    }
}