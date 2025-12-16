package com.clothingshop.styleera.controller;


import com.clothingshop.styleera.model.Image;
import com.clothingshop.styleera.model.Product;
import com.clothingshop.styleera.service.ServiceImg;
import com.clothingshop.styleera.service.ServiceProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductController", value = "/ProductController")
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServiceProduct serviceProduct = new ServiceProduct();
        ServiceImg serviceImg = new ServiceImg();
        Map<Integer, Image> thumbnailImg = new LinkedHashMap<>();
        List<Product> products = serviceProduct.findAll();

        for (Product p : products) {
            List<Image> imgs = serviceImg.findByProductId(p.getId());
            Image thumbnail = (imgs == null || imgs.isEmpty())?null:imgs.get(0);
            System.out.println("Product ID: " + p.getId());

            if (thumbnail == null) {
                System.out.println("  -> thumbnail = NULL");
            } else {
                System.out.println("  -> imagePath = " + thumbnail.getImagePath());
            }

            thumbnailImg.put(p.getId(), thumbnail);
        }



        request.setAttribute("products", products);
        request.setAttribute("thumbnailImg", thumbnailImg);
        request.getRequestDispatcher("/views/pages/product.jsp")
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}