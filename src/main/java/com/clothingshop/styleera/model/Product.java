package com.clothingshop.styleera.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Product implements Serializable {
    private int product_id;
    private SubCategory subcategory;
    private String product_name;
    private double medium_rating;
    private String short_description;
    private String detail_description;
    private double price;
    private Timestamp created_at;
    private Timestamp updated_at;
    private String thumbnail;
    private Integer defaultVariantId;

    public  Product(){

    }

    public Product(int product_id, SubCategory subcategories, String product_name, double medium_rating, String short_description, String detail_description, double price, Timestamp created_at, Timestamp updated_at) {
        this.product_id = product_id;
        this.subcategory = subcategories;
        this.product_name = product_name;
        this.medium_rating = medium_rating;
        this.short_description = short_description;
        this.detail_description = detail_description;
        this.price = price;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Integer getDefaultVariantId() {
        return defaultVariantId;
    }

    public void setDefaultVariantId(Integer defaultVariantId) {
        this.defaultVariantId = defaultVariantId;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public SubCategory getSubcategories() {
        return subcategory;
    }

    public void setSubcategories(SubCategory subcategories) {
        this.subcategory = subcategories;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public double getMedium_rating() {
        return medium_rating;
    }

    public void setMedium_rating(double medium_rating) {
        this.medium_rating = medium_rating;
    }

    public String getShort_description() {
        return short_description;
    }

    public void setShort_description(String short_description) {
        this.short_description = short_description;
    }

    public String getDetail_description() {
        return detail_description;
    }

    public void setDetail_description(String detail_description) {
        this.detail_description = detail_description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
}