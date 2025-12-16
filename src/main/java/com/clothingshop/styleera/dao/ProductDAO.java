package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import com.clothingshop.styleera.model.Product;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ProductDAO {
    public List<Product> findAll(){
        Jdbi jdbi = JDBIConnector.getJdbi();
        List<Product> p = jdbi.withHandle(handle -> {
            String sql = "SELECT\n" +
                    "    p.id AS id,\n" +
                    "    p.product_name AS productName,\n" +
                    "    p.medium_rating AS mediumRating,\n" +
                    "    p.short_description AS shortDescription,\n" +
                    "    p.detail_description AS detailDescription,\n" +
                    "    p.price AS price,\n" +
                    "    p.created_at AS createdAt,\n" +
                    "    p.updated_at AS updatedAt,\n" +
                    "    s.id AS subcategories_categorySubId\n" +
                    "FROM products p\n" +
                    "JOIN subcategories s\n" +
                    "    ON p.subcategory_id = s.id\n" +
                    "LIMIT 9;";
            return handle.createQuery(sql).mapToBean(Product.class).list();
        });
        return p;
    }

    public List<Product> findById(int id){
        Jdbi jdbi = JDBIConnector.getJdbi();
        List<Product> p = jdbi.withHandle(handle -> {
            String sql = "Select * from products where id = :id";
            return handle.createQuery(sql).bind("id", id).mapToBean(Product.class).list();
        });
        return p;
    }
}
