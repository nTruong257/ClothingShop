package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import com.clothingshop.styleera.model.Product;
import org.jdbi.v3.core.Jdbi;

import java.util.List;
import java.util.Optional;

public class ProductDetailDao {

    private final Jdbi jdbi = JDBIConnector.getJdbi();

    public Optional<Product> getProductById(int productId) {

        String sql = "SELECT " +
                "product_id, category_sub_id, product_name, " +
                "medium_rating, short_description, detail_description, " +
                "price, updated_at, created_at " +
                "FROM Products " +
                "WHERE product_id = ?";

        return jdbi.withHandle(handle -> {
            return handle.createQuery(sql)
                    .bind(0, productId)
                    .mapToBean(Product.class)
                    .findFirst();
        });
    }

    public List<String> getProductImageUrls(int productId) {
        // Giả định bảng Images có cột 'path' và 'product_id'
        String sql = "SELECT path FROM Images WHERE product_id = ? ORDER BY is_thumbnail DESC, image_id ASC";

        return jdbi.withHandle(handle -> {
            return handle.createQuery(sql)
                    .bind(0, productId)
                    .mapTo(String.class)
                    .list();
        });
    }

}