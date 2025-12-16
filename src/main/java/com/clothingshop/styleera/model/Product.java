package com.clothingshop.styleera.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Product implements Serializable {
    private int id;
    private Subcategories subcategories;
    private String productName;
    private double mediumRating;
    private String shortDescription;
    private String detailDescription;
    private double price;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public  Product(){

    }

    public Product(int id, Subcategories subcategories, String productName, double mediumRating, String shortDescription, String detailDescription, double price, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.subcategories = subcategories;
        this.productName = productName;
        this.mediumRating = mediumRating;
        this.shortDescription = shortDescription;
        this.detailDescription = detailDescription;
        this.price = price;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Subcategories getSubcategories() {
        return subcategories;
    }

    public void setSubcategories(Subcategories subcategories) {
        this.subcategories = subcategories;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getMediumRating() {
        return mediumRating;
    }

    public void setMediumRating(double mediumRating) {
        this.mediumRating = mediumRating;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getDetailDescription() {
        return detailDescription;
    }

    public void setDetailDescription(String detailDescription) {
        this.detailDescription = detailDescription;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
}