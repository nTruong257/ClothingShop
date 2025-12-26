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
        // 1. Khai báo các biến với giá trị mặc định ở ngoài khối try
        Product product = null;
        List<String> imageList = null;
        List<Variants> variantList = null;
        List<Product> relatedProducts = null;

        try {
            if (productIdStr != null && !productIdStr.isEmpty()) {
                int productId = Integer.parseInt(productIdStr);
                product = serviceProduct.findById(productId);

                if (product != null) {
                    imageList = serviceProduct.getImagesByProductId(productId);
                    variantList = serviceProduct.getVariantsByProductId(productId);

                    if (product.getSubcategories() != null) {
                        int subId = product.getSubcategories().getId();
                        relatedProducts = serviceProduct.getRelatedProducts(subId, productId);
                    }
                }
            }
        } catch (NumberFormatException e) {
            // Ghi log nhẹ nhàng cho lỗi định dạng ID
            getServletContext().log("Định dạng ID không hợp lệ: " + productIdStr);
        } catch (Exception e) {
            // Thay thế printStackTrace bằng logging của ServletContext (Robust logging)
            getServletContext().log("Lỗi hệ thống khi lấy chi tiết sản phẩm ID: " + productIdStr, e);
        }

        // 2. Xử lý gửi dữ liệu (Nằm ngoài try-catch)
        if (product != null) {
            request.setAttribute("product", product);
            request.setAttribute("imageList", imageList);
            request.setAttribute("variantList", variantList);
            request.setAttribute("relatedProducts", relatedProducts);

            // Lệnh forward này thực sự ném ra ServletException, giúp xóa lỗi cảnh báo của bạn
            request.getRequestDispatcher("/views/pages/product_detail.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Sản phẩm không tồn tại.");
        }
    }
}