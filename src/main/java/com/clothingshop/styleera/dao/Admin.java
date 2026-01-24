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
    // Thêm 2 phương thức này vào class Admin hiện tại của bạn
    public int insertReview(int productId, int userId, int rating, String comment, String color, String size) {
        return jdbi.withHandle(handle -> {
            // 1. Tìm variant_id khớp với màu và size khách chọn
            Integer variantId = handle.createQuery("SELECT id FROM variants WHERE product_id = ? AND color = ? AND size = ?")
                    .bind(0, productId)
                    .bind(1, color)
                    .bind(2, size)
                    .mapTo(Integer.class)
                    .findOne().orElse(null);

            // 2. Chèn vào bảng review
            return handle.createUpdate("INSERT INTO review (product_id, user_id, variant_id, rating, comment, created_at) " +
                            "VALUES (:pId, :uId, :vId, :rat, :com, NOW())")
                    .bind("pId", productId)
                    .bind("uId", userId)
                    .bind("vId", variantId)
                    .bind("rat", rating)
                    .bind("com", comment)
                    .executeAndReturnGeneratedKeys()
                    .mapTo(Integer.class)
                    .one();
        });
    }

    public void insertReviewImage(int reviewId, String imageUrl) {
        jdbi.useHandle(handle ->
                handle.createUpdate("INSERT INTO reviewimages (review_id, image_url) VALUES (?, ?)")
                        .bind(0, reviewId)
                        .bind(1, imageUrl)
                        .execute()
        );
    }
}