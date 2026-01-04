package com.clothingshop.styleera.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PlaceOrderController")
public class PlaceOrderController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 1. Lấy thông tin người dùng từ Form JSP mới sửa
        String fullName = request.getParameter("shipping_firstname");
        String phone = request.getParameter("shipping_phone");
        String address = request.getParameter("shipping_address_1");
        String zone = request.getParameter("shipping_zone_id");
        String district = request.getParameter("shipping_district");
        String date = request.getParameter("shipping_date");
        String time = request.getParameter("shipping_time");
        String note = request.getParameter("shipping_note");

        // 2. Lấy thông tin sản phẩm (từ các thẻ input hidden)
        String pName = request.getParameter("hProductName");
        String pQty = request.getParameter("hQty");
        String pTotal = request.getParameter("hTotal");

        // 3. Đóng gói dữ liệu gửi sang trang order_success.jsp
        request.setAttribute("uName", fullName);
        request.setAttribute("uPhone", phone);
        request.setAttribute("uAddress", address + ", " + district + ", " + zone);

        request.setAttribute("uDate", date);
        request.setAttribute("uTime", time);
        request.setAttribute("uNote", note);

        // Thông tin sản phẩm để hiển thị ở trang cuối
        request.setAttribute("pName", pName);
        request.setAttribute("pQty", pQty);
        request.setAttribute("pTotal", pTotal);

        request.getRequestDispatcher("/views/pages/order_success.jsp").forward(request, response);
    }
}
