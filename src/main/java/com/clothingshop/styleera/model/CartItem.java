package com.clothingshop.styleera.model;

import java.sql.Timestamp;

public class CartItem {
    private int cartItemId;
    private int userId;
    private int variantId;
    private String productName;
    private String imageUrl;
    private double price;
    private int quantity;
    private double totalPrice;
    private Timestamp created_at;
    private Timestamp updated_at;

    public CartItem() {
    }

    public CartItem(int cartItemId, int userId, int variantId, String productName, String imageUrl, double price, int quantity, double totalPrice, Timestamp created_at, Timestamp updated_at) {
        this.cartItemId = cartItemId;
        this.userId = userId;
        this.variantId = variantId;
        this.productName = productName;
        this.imageUrl = imageUrl;
        this.price = price;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
}


