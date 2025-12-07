package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.model.ParentCategory;
import com.clothingshop.styleera.model.SubCategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    private DBContext dbContext = new DBContext();  // Sử dụng DBContext để lấy connection

    public List<ParentCategory> getAllParentCategoriesWithSubs() {
        List<ParentCategory> parents = new ArrayList<>();
        String sqlParents = "SELECT * FROM parentcategories";
        String sqlSubs = "SELECT * FROM subcategories WHERE parent_category_id = ?";

        try (Connection conn = dbContext.getConnection();  // Lấy connection từ DBContext
             PreparedStatement psParents = conn.prepareStatement(sqlParents);
             ResultSet rsParents = psParents.executeQuery()) {

            while (rsParents.next()) {
                ParentCategory parent = new ParentCategory(
                        rsParents.getInt("id"),
                        rsParents.getString("parent_name")  // Sử dụng parent_name từ hình
                );

                // Load subs
                List<SubCategory> subs = new ArrayList<>();
                try (PreparedStatement psSubs = conn.prepareStatement(sqlSubs)) {
                    psSubs.setInt(1, parent.getId());
                    try (ResultSet rsSubs = psSubs.executeQuery()) {
                        while (rsSubs.next()) {
                            subs.add(new SubCategory(
                                    rsSubs.getInt("id"),
                                    rsSubs.getString("sub_name"),  // Sử dụng sub_name từ hình
                                    rsSubs.getInt("parent_category_id")
                            ));
                        }
                    }
                }
                parent.setSubCategories(subs);
                parents.add(parent);
            }
        } catch (Exception e) {  // Catch Exception như trong hình
            e.printStackTrace();  // Thay bằng logging thực tế
        }
        return parents;
    }
}
