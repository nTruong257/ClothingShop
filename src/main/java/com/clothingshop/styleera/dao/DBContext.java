package com.clothingshop.styleera.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.io.InputStream;
import java.util.Properties;

public class DBContext {

    public Connection getConnection() {
        Connection conn = null;
        try {
            // 1. Tạo đối tượng Properties
            Properties props = new Properties();

            // 2. Tìm file db.properties trong thư mục resources
            InputStream input = getClass().getClassLoader().getResourceAsStream("db.properties");

            if (input == null) {
                System.out.println("Lỗi: Không tìm thấy file db.properties!");
                return null;
            }

            // 3. Load dữ liệu
            props.load(input);

            // 4. Lấy thông tin
            String driver = props.getProperty("db.driver");
            String url = props.getProperty("db.url");
            String user = props.getProperty("db.username");
            String pass = props.getProperty("db.password");

            // 5. Kết nối
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    // Hàm main để test nhanh (Nhưng nhớ cấu hình Run nếu chạy trực tiếp)
    public static void main(String[] args) {
        DBContext db = new DBContext();
        Connection conn = db.getConnection();
        if (conn != null) {
            System.out.println("Kết nối thành công tới database !");
        } else {
            System.out.println("Kết nối thất bại!");
        }
    }
}