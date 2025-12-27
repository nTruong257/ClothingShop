package com.clothingshop.styleera.controller;
import com.clothingshop.styleera.model.Product;
import com.clothingshop.styleera.model.Variants;
import com.clothingshop.styleera.service.ProductService;
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
    private ProductService serviceProduct;

    @Override
    public void init() throws ServletException {
        this.serviceProduct = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String productIdStr = request.getParameter("id");

        Product product = null;
        List<String> imageList = null;
        List<Variants> variantList = null;
        List<Product> relatedProducts = null;
        List<String> colorList = null;

        try {
            if (productIdStr != null && !productIdStr.isEmpty()) {
                int product_id = Integer.parseInt(productIdStr);
                product = serviceProduct.findById(product_id);

                if (product != null) {
                    imageList = serviceProduct.getImagesByProductId(product_id);
                    variantList = serviceProduct.getVariantsByProductId(product_id);
                    // Truyền product_id vào service
                    colorList = serviceProduct.getColorsByProductId(product_id);

                    if (product.getSubcategories() != null) {
                        int subId = product.getSubcategories().getId();
                        relatedProducts = serviceProduct.getRelatedProducts(subId, product_id);
                    }
                }
            }
        } catch (Exception e) {
            getServletContext().log("Lỗi hệ thống khi lấy chi tiết sản phẩm ID: " + productIdStr, e);
        }

        if (product != null) {
            request.setAttribute("product", product);
            request.setAttribute("imageList", imageList);
            request.setAttribute("variantList", variantList);
            request.setAttribute("relatedProducts", relatedProducts);
            request.setAttribute("colorList", colorList);
            request.getRequestDispatcher("/views/pages/product_detail.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Sản phẩm không tồn tại.");
        }
    }
}