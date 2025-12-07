package com.clothingshop.styleera.filter;

import com.clothingshop.styleera.model.ParentCategory;
import com.clothingshop.styleera.service.CategoryService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

// Chạy trên mọi request (/*)
@WebFilter(filterName = "GlobalDataFilter", urlPatterns = {"/*"})
public class GlobalDataFilter implements Filter {

    private final CategoryService categoryService = new CategoryService();

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        String path = req.getRequestURI();

        // 1. TỐI ƯU: Bỏ qua các file tĩnh (ảnh, css, js) để không gọi Database thừa
        if (path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".png") || path.endsWith(".jpg") || path.endsWith(".jpeg")) {
            chain.doFilter(request, response);
            return;
        }

        // 2. LOGIC MENU: Kiểm tra nếu chưa có danh sách 'parents' thì mới gọi DB
        if (request.getAttribute("parents") == null) {
            try {
                List<ParentCategory> listCategories = categoryService.getAllCategories();
                request.setAttribute("parents", listCategories);
            } catch (Exception e) {
                e.printStackTrace(); // Ghi log nếu lỗi DB
            }
        }

        // 3. Cho phép đi tiếp vào Servlet/JSP đích
        chain.doFilter(request, response);
    }
}