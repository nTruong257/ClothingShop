package com.clothingshop.styleera.filter;

import com.clothingshop.styleera.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

// Áp dụng cho TẤT CẢ các request
@WebFilter(filterName = "AuthFilter", urlPatterns = {"/*"})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String path = req.getRequestURI();

        // 1. Bỏ qua các tài nguyên tĩnh (CSS, JS, Ảnh) để web chạy nhanh
        if (path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".png") || path.endsWith(".jpg")) {
            chain.doFilter(request, response);
            return;
        }

        // 2. Xác định các trang CẦN BẢO VỆ (Phải đăng nhập mới được vào)
        // Bạn có thể thêm các trang khác vào danh sách này
        boolean isProtectedPage = path.contains("/account.jsp") ||
                path.contains("/checkout.jsp") ||
                path.contains("/order-history.jsp") ||
                path.contains("/order_status.jsp") ||
                path.contains("/order_success.jsp");

        // 3. Logic kiểm tra Session
        HttpSession session = req.getSession(false); // false: Chỉ lấy session cũ, không tạo mới
        boolean isLoggedIn = (session != null && session.getAttribute("auth") != null);

        if (isProtectedPage) {
            if (!isLoggedIn) {
                // A. Nếu chưa đăng nhập mà cố vào trang bảo mật -> Đá về Login
                res.sendRedirect(req.getContextPath() + "/views/pages/login.jsp");
                return;
            } else {
                // B. Nếu đã đăng nhập -> Chặn Cache để khi Logout không Back lại được
                res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                res.setHeader("Pragma", "no-cache");
                res.setDateHeader("Expires", 0);
            }
        }

        // 4. Logic cho trang Login/Register (Nếu đã đăng nhập thì không cho vào lại trang login nữa)
        boolean isAuthPage = path.contains("/login.jsp") || path.contains("/register.jsp");
        if (isAuthPage && isLoggedIn) {
            res.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        // Cho phép đi tiếp
        chain.doFilter(request, response);
    }
}