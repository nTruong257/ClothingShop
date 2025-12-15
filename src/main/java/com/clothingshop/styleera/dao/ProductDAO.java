package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import com.clothingshop.styleera.model.Product;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ProductDAO {
    public List<Product> findAll(){
        Jdbi jdbi = JDBIConnector.getJdbi();
        List<Product> p = jdbi.withHandle(handle -> {
            String sql = "SELECT \n" +
                    "    p.product_id,\n" +
                    "    p.product_name,\n" +
                    "    p.medium_rating,\n" +
                    "    p.short_description,\n" +
                    "    p.detail_description,\n" +
                    "    p.price,\n" +
                    "    p.created_at,\n" +
                    "    p.updated_at,\n" +
                    "\n" +
                    "    -- map cho object Subcategories\n" +
                    "    s.category_sub_id   AS subcategories_category_sub_id\n" +
                    "FROM products p\n" +
                    "JOIN subcategories s \n" +
                    "    ON p.category_sub_id = s.category_sub_id \n" +
                    "LIMIT 9";
            return handle.createQuery(sql).mapToBean(Product.class).list();
        });
        return p;
    }

    public List<Product> findById(int id){
        Jdbi jdbi = JDBIConnector.getJdbi();
        List<Product> p = jdbi.withHandle(handle -> {
            String sql = "Select * from products where product_id = ?";
            return handle.createQuery(sql).bind(0, id).mapToBean(Product.class).list();
        });
        return p;
    }
}
