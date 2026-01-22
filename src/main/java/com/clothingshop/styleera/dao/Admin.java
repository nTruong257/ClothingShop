package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.model.Review;
import org.jdbi.v3.core.Jdbi;
import java.util.List;

public class Admin {
    private final Jdbi jdbi;

    public Admin(Jdbi jdbi) {
        this.jdbi = jdbi;
    }

    public List<Review> getAllReviews() {
        // SQL JOIN 4 bảng theo đúng file .sql bạn đã gửi
        String sql = "SELECT r.id, u.user_name AS userName, r.created_at AS createdAt, " +
                "v.color, v.size, r.comment AS content, ri.image_url AS imageUrl " +
                "FROM review r " +
                "JOIN users u ON r.user_id = u.id " +
                "LEFT JOIN variants v ON r.variant_id = v.id " +
                "LEFT JOIN reviewimages ri ON r.id = ri.review_id " +
                "ORDER BY r.created_at DESC";

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Review.class)
                        .list()
        );
    }
}