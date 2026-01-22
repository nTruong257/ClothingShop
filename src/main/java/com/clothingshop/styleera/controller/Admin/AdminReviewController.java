package com.clothingshop.styleera.controller.Admin;

import com.clothingshop.styleera.dao.Admin;
import com.clothingshop.styleera.model.Review;
import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminReviewController", urlPatterns = "/admin-reviews")
public class AdminReviewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Sử dụng JDBIConnector.getJdbi() theo file bạn đã gửi
        Admin adminDAO = new Admin(JDBIConnector.getJdbi());

        List<Review> reviews = adminDAO.getAllReviews();

        // Đẩy dữ liệu vào biến "reviews" để JSP sử dụng
        request.setAttribute("reviews", reviews);

        // Chuyển hướng đến đúng file JSP trong thư mục admin
        request.getRequestDispatcher("/admin/admin-comment.jsp").forward(request, response);
    }
}