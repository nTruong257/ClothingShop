package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import org.jdbi.v3.core.Jdbi;
import java.util.List;

public class VariantDAO {
    // Lấy danh sách các Size duy nhất đang có
    public List<String> getAllSizes() {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT DISTINCT size FROM variants ORDER BY size")
                        .mapTo(String.class)
                        .list()
        );
    }

    // Lấy danh sách các Màu duy nhất đang có
    public List<String> getAllColors() {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT DISTINCT color FROM variants ORDER BY color")
                        .mapTo(String.class)
                        .list()
        );
    }
}