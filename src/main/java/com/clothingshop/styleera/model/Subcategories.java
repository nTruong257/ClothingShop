package com.clothingshop.styleera.model;

import java.sql.Timestamp;

public class Subcategories {
    private int id;
    private ParentCategories parentCategories;
    private String itemName;
    private Timestamp updated_at;

    public Subcategories() {
    }

    public Subcategories(int id, ParentCategories parentCategories, String itemName, Timestamp updated_at) {
        this.id = id;
        this.parentCategories = parentCategories;
        this.itemName = itemName;
        this.updated_at = updated_at;
    }

    public int getCategory_sub_id() {

        return id;
    }

    public void setCategory_sub_id(int category_sub_id) {
        this.id = category_sub_id;
    }

    public ParentCategories getParentCategories() {
        return parentCategories;
    }

    public void setParentCategories(ParentCategories parentCategories) {
        this.parentCategories = parentCategories;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
}
