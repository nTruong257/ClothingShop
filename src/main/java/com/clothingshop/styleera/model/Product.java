package com.clothingshop.styleera.model;
import java.math.BigDecimal; // Quan trọng cho kiểu DECIMAL
import java.sql.Timestamp; // Quan trọng cho kiểu DATETIME/TIMESTAMP
import java.util.Arrays;
import java.util.List;
public class Product {
    private int productId;
    private int categorySubId;
    private String productName;
    private BigDecimal mediumRating; // Sửa từ double sang BigDecimal
    private String shortDescription;
    private String detailDescription;
    private BigDecimal price; // Sửa từ double sang BigDecimal
    private Timestamp updatedAt;
    private Timestamp createdAt;

    // Thêm trường để mô phỏng ảnh (vì không có trong bảng CSDL của bạn)
    private List<String> imageUrls;

    // Constructor mẫu (Có thể dùng Builder Pattern sau này)
    public Product(int productId, String productName, BigDecimal mediumRating,
                   String shortDescription, String detailDescription, BigDecimal price,
                   List<String> imageUrls) {

        this.productId = productId;
        this.productName = productName;
        this.mediumRating = mediumRating;
        this.shortDescription = shortDescription;
        this.detailDescription = detailDescription;
        this.price = price;
        this.imageUrls = imageUrls;
        // Các trường thời gian thường được CSDL tự động quản lý,
        // nhưng ta để mặc định cho constructor mẫu
        this.updatedAt = new Timestamp(System.currentTimeMillis());
        this.createdAt = new Timestamp(System.currentTimeMillis());
    }

    // --- Các phương thức Getter ---
    // (JSP/EL sẽ dùng các phương thức này)
    public int getProductId() { return productId; }
    public String getProductName() { return productName; }
    public BigDecimal getMediumRating() { return mediumRating; }
    public String getShortDescription() { return shortDescription; }
    public String getDetailDescription() { return detailDescription; }
    public BigDecimal getPrice() { return price; }
    public Timestamp getUpdatedAt() { return updatedAt; }
    public Timestamp getCreatedAt() { return createdAt; }
    public List<String> getImageUrls() { return imageUrls; }

    // (Bạn nên tạo thêm các Getter/Setter cho các trường còn lại nếu cần)
}