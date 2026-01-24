package com.clothingshop.styleera.controller.Admin;

import com.clothingshop.styleera.dao.Admin;
import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.File;

@WebServlet(name = "SubmitReviewController", urlPatterns = "/submit-review")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10)
public class AdminSubmitController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin adminDAO = new Admin(JDBIConnector.getJdbi());

        // 1. Lấy thông tin từ Form
        int productId = Integer.parseInt(request.getParameter("productId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        String content = request.getParameter("content");

        // Giả sử bạn lấy userId từ Session người dùng đã đăng nhập
        int userId = 1; // Thay bằng: ((User)request.getSession().getAttribute("user")).getId();

        // 2. Lưu Review và lấy ID vừa tạo
        int reviewId = adminDAO.insertReview(productId, userId, rating, content, color, size);

        // 3. Xử lý lưu ảnh (nếu có)
        Part filePart = request.getPart("images");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = "review_" + reviewId + ".png";
            String uploadPath = getServletContext().getRealPath("/") + "images/reviews";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePart.write(uploadPath + File.separator + fileName);
            adminDAO.insertReviewImage(reviewId, "/images/reviews/" + fileName);
        }

        response.sendRedirect(request.getContextPath() + "/productdetail?id=" + productId);
    }
}