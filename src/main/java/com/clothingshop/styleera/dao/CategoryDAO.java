package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import com.clothingshop.styleera.model.ParentCategory;
import com.clothingshop.styleera.model.SubCategory;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class CategoryDAO {

    public List<ParentCategory> getAllParentCategoriesWithSubs() {
        Jdbi jdbi = JDBIConnector.getJdbi();

        return jdbi.withHandle(handle -> {
            // 1. Lấy Parent (Nam, Nữ, Đồ Đôi)
            String sqlParents = "SELECT id, parent_name AS name FROM parentcategories";
            List<ParentCategory> parents = handle.createQuery(sqlParents)
                    .mapToBean(ParentCategory.class)
                    .list();

            // 2. Lấy Sub (Áo thun, Quần jean...)
            // CHÚ Ý: Cột category_parent_id
            String sqlSubs = "SELECT id, sub_name AS name, category_parent_id AS parentCategoryId " +
                    "FROM subcategories WHERE category_parent_id = :parentId";

            for (ParentCategory parent : parents) {
                List<SubCategory> subs = handle.createQuery(sqlSubs)
                        .bind("parentId", parent.getId())
                        .mapToBean(SubCategory.class)
                        .list();

                parent.setSubCategories(subs);
            }
            return parents;
        });
    }

    // Lấy tên danh mục cha theo ID
    public String getParentNameById(int id) {
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT parent_name FROM parentcategories WHERE id = ?")
                        .bind(0, id)
                        .mapTo(String.class)
                        .findOne().orElse("Sản phẩm")
        );
    }

    // Lấy tên danh mục con theo ID
    public String getSubNameById(int id) {
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT sub_name FROM subcategories WHERE id = ?")
                        .bind(0, id)
                        .mapTo(String.class)
                        .findOne().orElse("Sản phẩm")
        );
    }
}