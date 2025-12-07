package com.clothingshop.styleera.controller;

import com.clothingshop.styleera.dao.ProductDetailDao;
import com.clothingshop.styleera.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "ProductDetailController", urlPatterns = {"/product-detail"})
public class ProductDetailController extends HttpServlet {

    private ProductDetailDao productDetailDao;

    @Override
    public void init() throws ServletException {
        this.productDetailDao = new ProductDetailDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String productIdStr = request.getParameter("id");

        if (productIdStr == null || productIdStr.isEmpty()) {
            // Xử lý khi thiếu ID
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product ID parameter.");
            return;
        }

        try {
            int productId = Integer.parseInt(productIdStr);

            // 1. Lấy sản phẩm từ DAO
            Optional<Product> productOpt = productDetailDao.getProductById(productId);

            if (productOpt.isPresent()) {
                Product product = productOpt.get();

                // 2. Lấy danh sách ảnh
                List<String> imageUrls = productDetailDao.getProductImageUrls(productId);

                // 3. Đặt các thuộc tính vào Request Scope
                request.setAttribute("product", product);
                request.setAttribute("imageUrls", imageUrls);

                // 4. Chuyển hướng đến JSP
                request.getRequestDispatcher("/WEB-INF/views/product_detail.jsp").forward(request, response);
            } else {
                // Xử lý 404
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found.");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID format.");
        }
    }
}