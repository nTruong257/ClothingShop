package com.clothingshop.styleera.controller;

import com.clothingshop.styleera.model.Product;
import com.clothingshop.styleera.model.Variants;
import com.clothingshop.styleera.service.ServiceProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetailController", urlPatterns = {"/Product_DetailController"})
public class ProductDetailController extends HttpServlet {

    // Thay đổi từ ProductDetailDao sang ServiceProduct
    private ServiceProduct serviceProduct;

    @Override
    public void init() throws ServletException {
        this.serviceProduct = new ServiceProduct();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String productIdStr = request.getParameter("id");

        if (productIdStr == null || productIdStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product ID.");
            return;
        }

        try {
            int productId = Integer.parseInt(productIdStr);

            // 1. Lấy thông tin sản phẩm từ Service
            Product product = serviceProduct.findById(productId);

            if (product != null) {
                // 2. Lấy danh sách ảnh (Gallery)
                List<String> imageList = serviceProduct.getImagesByProductId(productId);

                // 3. Lấy danh sách biến thể (Size/Màu)
                List<Variants> variantList = serviceProduct.getVariantsByProductId(productId);

                if (product.getSubcategories() != null) {
                    int subCategoryId = product.getSubcategories().getParentCategoryId();

                    // Gọi Service để lấy danh sách (loại trừ ID sản phẩm hiện tại)
                    List<Product> relatedProducts = serviceProduct.getRelatedProducts(subCategoryId, productId);
                    // Lấy ID từ cột category_sub_id của sản phẩm đang xem
                    int subId = product.getSubcategories().getId();
                    List<Product> RelatedProducts = serviceProduct.getRelatedProducts(subId, product.getProduct_id());
                    // Đẩy danh sách liên quan vào request
                    request.setAttribute("relatedProducts", relatedProducts);
                }
                // 4. Đặt dữ liệu vào Request Scope
                request.setAttribute("product", product);
                request.setAttribute("imageList", imageList); // Đổi tên cho khớp với code JSP trước đó
                request.setAttribute("variantList", variantList);

                // 5. Chuyển hướng đến JSP
                request.getRequestDispatcher("/views/pages/product_detail.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found.");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID.");
        }
    }

}