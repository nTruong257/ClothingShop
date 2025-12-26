package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import org.jdbi.v3.core.Jdbi;
import java.util.List;

public class VariantDAO {
    // Lấy danh sách các Size duy nhất đang có
    public List<String> getAllSizes() {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT DISTINCT size FROM variants ORDER BY size")
                        .mapTo(String.class)
                        .list()
        );
    }

    // Lấy danh sách các Màu duy nhất đang có
    public List<String> getAllColors() {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT DISTINCT color FROM variants ORDER BY color")
                        .mapTo(String.class)
                        .list()
        );
    }
    // Lấy danh sách màu sắc CHỈ của sản phẩm đang xem
    public List<String> getColorsByProductId(int product_id) { // Đổi tên tham số ở đây
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle ->
                // Sử dụng product_id cho cả tên cột và tên biến bind
                handle.createQuery("SELECT DISTINCT color FROM variants WHERE product_id = :product_id")
                        .bind("product_id", product_id)
                        .mapTo(String.class)
                        .list()
        );

    }

}