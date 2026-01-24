package com.clothingshop.styleera.model;

import java.sql.Timestamp;

public class Review {
    // 1. Các trường bắt buộc để LƯU vào Database (Khớp với file .sql của bạn)
    private int id;
    private int productId;   // ID sản phẩm được đánh giá
    private int userId;      // ID người dùng thực hiện đánh giá
    private int variantId;   // ID của biến thể (màu/size) đã mua
    private int rating;      // Số sao (1-5)
    private String comment;  // Nội dung lời bình (tương ứng với content)
    private Timestamp createdAt;

    // 2. Các trường hỗ trợ HIỂN THỊ (Dùng cho Admin và ProductDetail)
    private String userName; // Tên khách hàng (lấy từ bảng users)
    private String color;    // Tên màu (lấy từ bảng variants)
    private String size;     // Tên size (lấy từ bảng variants)
    private String imageUrl; // Ảnh đánh giá (lấy từ bảng reviewimages)

    public Review() {}

    // --- Bắt đầu Getters và Setters ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getVariantId() { return variantId; }
    public void setVariantId(int variantId) { this.variantId = variantId; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }

    public String getSize() { return size; }
    public void setSize(String size) { this.size = size; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}