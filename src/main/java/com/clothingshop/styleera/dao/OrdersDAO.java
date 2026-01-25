package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

public class OrdersDAO {
    private Jdbi jdbi;
    // đếm tổng các order (đơn hàng)
    public int countTotalOrders() {
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM orders")
                        .mapTo(Integer.class)
                        .one()
        );
    }

}
