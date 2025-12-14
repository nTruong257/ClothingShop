package com.clothingshop.styleera.model;

import java.sql.Timestamp;

public class ParentCategories {
    private int category_parent_id;
    private String groupName;
    private Timestamp updated_at;

    public ParentCategories() {
    }

    public ParentCategories(int category_parent_id, String groupName, Timestamp updated_at) {
        this.category_parent_id = category_parent_id;
        this.groupName = groupName;
        this.updated_at = updated_at;
    }

    public int getCategory_parent_id() {
        return category_parent_id;
    }

    public void setCategory_parent_id(int category_parent_id) {
        this.category_parent_id = category_parent_id;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
}
