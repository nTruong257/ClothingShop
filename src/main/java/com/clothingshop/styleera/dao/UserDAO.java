package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.model.Address;
import com.clothingshop.styleera.model.User;
import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class UserDAO {

    // 1. Đăng ký user kèm mã OTP
    public void registerUser(User user, String otpCode) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        jdbi.useHandle(handle -> {
            String sql = "INSERT INTO users (user_name, email, password_hash, phone, role, status, verification_code, enabled) " +
                    "VALUES (?, ?, ?, ?, 'User', 'Hoạt Động', ?, 0)";
            handle.createUpdate(sql)
                    .bind(0, user.getUser_name())
                    .bind(1, user.getEmail())
                    .bind(2, user.getPassword_hash())
                    .bind(3, user.getPhone())
                    .bind(4, otpCode)
                    .execute();
        });
    }

    // 2. Kiểm tra OTP có đúng không
    public boolean checkOtp(String email, String inputOtp) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle -> {
            String sql = "SELECT COUNT(*) FROM users WHERE email = ? AND verification_code = ?";
            int count = handle.createQuery(sql)
                    .bind(0, email)
                    .bind(1, inputOtp)
                    .mapTo(Integer.class)
                    .one();
            return count > 0;
        });
    }

    // 3. Kích hoạt tài khoản (Xóa OTP, set enabled=1)
    public void activeUser(String email) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        jdbi.useHandle(handle -> {
            String sql = "UPDATE users SET enabled = 1, verification_code = NULL WHERE email = ?";
            handle.createUpdate(sql).bind(0, email).execute();
        });
    }

    // 4. Tìm User theo Email (Dùng cho login & check trùng)
    public User findByEmail(String email) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM users WHERE email = ?")
                        .bind(0, email)
                        .mapToBean(User.class)
                        .findOne().orElse(null)
        );
    }
    //5. Lấy tất cả User
    public List<User> findAllUsers() {
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM users")
                        .mapToBean(User.class)
                        .list()
        );
    }
    // 6. Lấy Địa chỉ Address User
    public List<Address> findAllAddresses() {
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM addresses")
                        .mapToBean(Address.class)
                        .list()
        );
    }
}