package com.clothingshop.styleera.model;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;
public class Productdetail {
    private int productId;
    private int categorySubId;
    private String productName;
    private BigDecimal mediumRating;
    private String shortDescription;
    private String detailDescription;
    private BigDecimal price;
    private Timestamp updatedAt;
    private Timestamp createdAt;

    private List<String> imageUrls;

    // Constructor mẫu (Có thể dùng Builder Pattern sau này)
    public Productdetail(int productId, String productName, BigDecimal mediumRating,
                   String shortDescription, String detailDescription, BigDecimal price,
                   List<String> imageUrls) {

        this.productId = productId;
        this.productName = productName;
        this.mediumRating = mediumRating;
        this.shortDescription = shortDescription;
        this.detailDescription = detailDescription;
        this.price = price;
        this.imageUrls = imageUrls;
        this.updatedAt = new Timestamp(System.currentTimeMillis());
        this.createdAt = new Timestamp(System.currentTimeMillis());
    }

    public int getProductId() { return productId; }
    public String getProductName() { return productName; }
    public BigDecimal getMediumRating() { return mediumRating; }
    public String getShortDescription() { return shortDescription; }
    public String getDetailDescription() { return detailDescription; }
    public BigDecimal getPrice() { return price; }
    public Timestamp getUpdatedAt() { return updatedAt; }
    public Timestamp getCreatedAt() { return createdAt; }
    public List<String> getImageUrls() { return imageUrls; }

}