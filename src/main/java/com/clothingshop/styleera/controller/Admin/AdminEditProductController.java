package com.clothingshop.styleera.controller.Admin;

import com.clothingshop.styleera.dao.ProductDAO;
import com.clothingshop.styleera.model.ParentCategory;
import com.clothingshop.styleera.model.Product;
import com.clothingshop.styleera.model.SubCategory;
import com.clothingshop.styleera.model.Variants;
import com.clothingshop.styleera.service.CategoryService;
import com.clothingshop.styleera.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminEditProductController", value = "/AdminEditProduct")
public class AdminEditProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductService productService = new ProductService();
        CategoryService categoryService = new CategoryService();
        Product product = productService.getProductEditById(productId);
        List<Variants> variants = productService.getVariantsByProductId(productId);
        List<ParentCategory> parents = categoryService.getAllCategories();

        request.setAttribute("parents", parents);
        request.setAttribute("product", product);
        Variants variant = null;
        if (variants != null && !variants.isEmpty()) {
            variant = variants.get(0);
        }

        request.setAttribute("variant", variant);
        request.getRequestDispatcher("/admin/admin-form.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        try {
            request.setCharacterEncoding("UTF-8");

            int productId = Integer.parseInt(request.getParameter("productId"));
            int subCategoryId = Integer.parseInt(request.getParameter("subCategoryId"));
            int variantId = Integer.parseInt(request.getParameter("variantId"));

            String productName = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // ===== Build SubCategory =====
            SubCategory sub = new SubCategory();
            sub.setId(subCategoryId);

            // ===== Build Product =====
            Product product = new Product();
            product.setProduct_id(productId);
            product.setProduct_name(productName);
            product.setPrice(price);
            product.setSubcategories(sub);

            // ===== Update =====
            productDAO.editProduct(product, quantity, variantId);

            // ===== Redirect =====
            response.sendRedirect(request.getContextPath() + "/admin-products");

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("error", "Cập nhật sản phẩm thất bại");
            request.getRequestDispatcher("/admin/admin-form.jsp")
                    .forward(request, response);
        }
    }
}