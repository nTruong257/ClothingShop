package com.clothingshop.styleera.service;

import com.clothingshop.styleera.dao.OrdersDAO;

public class OrdersService {
    private OrdersDAO ordersDAO = new OrdersDAO();
    public int getTotalOrders() {
        return ordersDAO.countTotalOrders();
    }
}
