package com.clothingshop.styleera.filter;

import com.clothingshop.styleera.model.ParentCategory;
import com.clothingshop.styleera.service.CategoryService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "GlobalDataFilter", urlPatterns = {"/*"})
public class GlobalDataFilter implements Filter {

    private final CategoryService categoryService = new CategoryService();

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        String path = req.getRequestURI();

        // Setup biến 'root' để dùng trong JSP
        request.setAttribute("root", req.getContextPath());

        // Tối ưu: Bỏ qua file tĩnh
        if (path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".png") || path.endsWith(".jpg") || path.endsWith(".jpeg") || path.endsWith(".woff2")) {
            chain.doFilter(request, response);
            return;
        }

        // Load Menu Categories (chỉ load khi chưa có)
        if (request.getAttribute("parents") == null) {
            try {
                List<ParentCategory> listCategories = categoryService.getAllCategories();
                request.setAttribute("parents", listCategories);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        chain.doFilter(request, response);
    }
}