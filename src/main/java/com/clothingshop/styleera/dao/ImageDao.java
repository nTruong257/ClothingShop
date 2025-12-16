package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import com.clothingshop.styleera.model.Image;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ImageDao {
    public List<Image> findByProductId(int productId) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        List<Image> images = jdbi.withHandle(handle -> {
            String sql = "SELECT \n" +
                    "                i.image_id,\n" +
                    "                i.image_name,\n" +
                    "                i.path AS imagePath,\n" +
                    "                i.updated_at,\n" +
                    "                i.product_id AS product_product_id\n" +
                    "            FROM images i\n" +
                    "            WHERE i.product_id = :productId";

            return handle.createQuery(sql).bind("productId", productId).mapToBean(Image.class).list();

        });

        return images;
    }

    public List<Image> findById(int imageId) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        List<Image> img = jdbi.withHandle(handle -> {
            String sql = "SELECT \n" +
                    "                i.image_id,\n" +
                    "                i.image_name,\n" +
                    "                i.path AS imagePath,\n" +
                    "                i.updated_at,\n" +
                    "                i.product_id AS product_product_id\n" +
                    "            FROM images i\n" +
                    "            WHERE i.image_id = :imageId";
            return handle.createQuery(sql).bind("imageId", imageId).mapToBean(Image.class).list();
        });
        return img;
    }
}