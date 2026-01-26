package com.clothingshop.styleera.model;

public class Address {
    private int id;
    private int userId;
    private String street;
    private String province;
    private String district;
    private int isDefault;

    public Address() {
    }

    public Address(int id, int userId, String street, String province,
                   String district, int isDefault) {
        this.id = id;
        this.userId = userId;
        this.street = street;
        this.province = province;
        this.district = district;
        this.isDefault = isDefault;
    }

    // getter & setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public int getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(int isDefault) {
        this.isDefault = isDefault;
    }
}
