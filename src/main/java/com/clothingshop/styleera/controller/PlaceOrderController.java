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

        // 1. Lấy thông tin người dùng từ Form
        String fullName = request.getParameter("shipping_firstname");
        String phone = request.getParameter("shipping_phone");
        String address = request.getParameter("shipping_address_1");
        String zone = request.getParameter("shipping_zone_id");
        String district = request.getParameter("shipping_district");
        String date = request.getParameter("shipping_date");
        String time = request.getParameter("shipping_time");
        String note = request.getParameter("shipping_note");
        String payment = request.getParameter("hPaymentMethod");

        // 2. Lấy thông tin sản phẩm (từ các thẻ input hidden gửi kèm)
        String pName = request.getParameter("hProductName");
        String pImage = request.getParameter("hProductImage");
        String pSize = request.getParameter("hSize");
        String pColor = request.getParameter("hColor");
        String pQty = request.getParameter("hQty");
        String subTotal = request.getParameter("hSubTotal");
        String shipping = request.getParameter("hShipping");
        String pTotal = request.getParameter("hTotal");

        // 3. Đóng gói dữ liệu để gửi sang trang order_success.jsp
        request.setAttribute("uName", fullName);
        request.setAttribute("uPhone", phone);
        // Kết hợp địa chỉ đầy đủ
        request.setAttribute("uAddress", address + ", " + district + ", " + zone);
        request.setAttribute("uDate", date);
        request.setAttribute("uTime", time);
        request.setAttribute("uNote", note);
        request.setAttribute("uPayment", payment);

        // Thông tin sản phẩm
        request.setAttribute("pName", pName);
        request.setAttribute("pImage", pImage);
        request.setAttribute("pSize", pSize);
        request.setAttribute("pColor", pColor);
        request.setAttribute("pQty", pQty);
        request.setAttribute("cTotal", pTotal);
        request.setAttribute("cSubTotal", subTotal);
        request.setAttribute("cShipping", shipping);
        // Chuyển tiếp (Forward) để giữ lại dữ liệu trong Request
        request.getRequestDispatcher("/views/pages/order_success.jsp").forward(request, response);
    }
}
