package com.clothingshop.styleera.controller;

import com.clothingshop.styleera.model.Product;
import com.clothingshop.styleera.service.ProductService;
import com.clothingshop.styleera.service.VariantService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Khởi tạo Service/DAO
        ProductService productService = new ProductService();
        com.clothingshop.styleera.dao.ProductDAO productDAO = new com.clothingshop.styleera.dao.ProductDAO();
        com.clothingshop.styleera.dao.CategoryDAO categoryDAO = new com.clothingshop.styleera.dao.CategoryDAO();
        com.clothingshop.styleera.dao.VariantDAO variantDAO = new com.clothingshop.styleera.dao.VariantDAO();
        VariantService variantService = new VariantService();

        List<Product> products = null;
        String title = "Tất cả sản phẩm";

        // 2. Lấy tham số từ URL
        String parentIdParam = request.getParameter("parentId");
        String cateIdParam = request.getParameter("cateId");
        String sortParam = request.getParameter("sort"); // Lấy tham số sắp xếp

        try {
            if (cateIdParam != null) {
                // Lọc theo danh mục con
                int cateId = Integer.parseInt(cateIdParam);
                products = productService.findBySubCategoryId(cateId);
                title = categoryDAO.getSubNameById(cateId);

            } else if (parentIdParam != null) {
                // Lọc theo danh mục cha
                int parentId = Integer.parseInt(parentIdParam);
                products = productService.findByParentCategoryId(parentId);
                String parentName = categoryDAO.getParentNameById(parentId);
                title = "Tất cả sản phẩm " + parentName;

            } else if (sortParam != null) {
                // --- XỬ LÝ SẮP XẾP (New, Bestseller, Price...) ---
                products = productDAO.findAllSorted(sortParam);

                // Đặt lại tiêu đề cho phù hợp
                if(sortParam.equals("newest")) title = "Hàng Mới Về";
                else if(sortParam.equals("bestseller")) title = "Sản Phẩm Bán Chạy";
                else title = "Tất cả sản phẩm";

            } else {
                // Mặc định lấy tất cả
                products = productService.findAll();
            }
        } catch (NumberFormatException e) {
            products = productService.findAll();
        }
        if(products != null && !products.isEmpty()) {
            for (Product p: products) {
                Integer defaultVariantId = variantService.getDefaultVariantId(p.getProduct_id());
                p.setDefaultVariantId(defaultVariantId);

            }
        }

        // 3. Đẩy dữ liệu ra JSP
        request.setAttribute("products", products);
        request.setAttribute("categoryTitle", title);

        // Đẩy tham số sort hiện tại ra để JSP giữ trạng thái selected trong dropdown
        request.setAttribute("currentSort", sortParam);

        request.setAttribute("listSizes", variantDAO.getAllSizes());
        request.setAttribute("listColors", variantDAO.getAllColors());

        request.getRequestDispatcher("/views/pages/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hiện tại chưa xử lý POST
    }
}