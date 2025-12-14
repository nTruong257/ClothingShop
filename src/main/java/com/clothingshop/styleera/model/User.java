package com.clothingshop.styleera.model;

import java.sql.Timestamp;

public class User {
    private int userId;
    private String username;
    private String email;
    private String password;
    private String phone;
    private String status;
    private String role;
    private Timestamp created_at;

    public User() {
    }

    public User(int userId, String username, String email, String password, String phone, String status, String role, Timestamp created_at) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.status = status;
        this.role = role;
        this.created_at = created_at;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
}
