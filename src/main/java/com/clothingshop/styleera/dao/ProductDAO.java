package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.model.Variants;
import com.clothingshop.styleera.JDBiConnector.JDBIConnector;
import com.clothingshop.styleera.model.Product;
import org.jdbi.v3.core.Jdbi;
import java.util.List;

public class ProductDAO {

    // 1. Lấy sản phẩm mới nhất (Home)
    // Sắp xếp theo created_at giảm dần
    public List<Product> findNewArrivals() {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle -> {
            String sql = "SELECT p.id AS product_id, p.product_name, p.price, p.short_description, " +
                    "p.average_rating AS medium_rating, i.path AS thumbnail " +
                    "FROM products p " +
                    "LEFT JOIN images i ON p.image_id = i.id " +
                    "ORDER BY p.created_at DESC LIMIT 8";
            return handle.createQuery(sql).mapToBean(Product.class).list();
        });
    }

    // 2. Lấy sản phẩm bán chạy (Home)
    // Sắp xếp theo average_rating giảm dần (giả lập bán chạy)
    public List<Product> findBestSellers() {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle -> {
            String sql = "SELECT p.id AS product_id, p.product_name, p.price, p.short_description, " +
                    "p.average_rating AS medium_rating, i.path AS thumbnail " +
                    "FROM products p " +
                    "LEFT JOIN images i ON p.image_id = i.id " +
                    "ORDER BY p.average_rating DESC LIMIT 4";
            return handle.createQuery(sql).mapToBean(Product.class).list();
        });
    }

    // 3. Lấy tất cả sản phẩm (Trang Product)
    public List<Product> findAll(){
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle -> {
            String sql = "SELECT p.id AS product_id, p.product_name, p.price, " +
                    "p.average_rating AS medium_rating, i.path AS thumbnail " +
                    "FROM products p " +
                    "LEFT JOIN images i ON p.image_id = i.id";
            return handle.createQuery(sql).mapToBean(Product.class).list();
        });
    }

    // 4. Lọc theo danh mục con (Trang Product)
    // Cột trong DB của bạn là: category_sub_id
    public List<Product> findBySubCategoryId(int subId) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle -> {
            String sql = "SELECT p.id AS product_id, p.product_name, p.price, " +
                    "p.average_rating AS medium_rating, i.path AS thumbnail " +
                    "FROM products p " +
                    "LEFT JOIN images i ON p.image_id = i.id " +
                    "WHERE p.category_sub_id = ?";
            return handle.createQuery(sql).bind(0, subId).mapToBean(Product.class).list();
        });
    }

    // 5. Lọc theo danh mục cha (Trang Product)
    // JOIN bảng subcategories qua cột id, lọc bằng category_parent_id
    public List<Product> findByParentCategoryId(int parentId) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle -> {
            String sql = "SELECT p.id AS product_id, p.product_name, p.price, " +
                    "p.average_rating AS medium_rating, i.path AS thumbnail " +
                    "FROM products p " +
                    "JOIN subcategories s ON p.category_sub_id = s.id " +
                    "LEFT JOIN images i ON p.image_id = i.id " +
                    "WHERE s.category_parent_id = ?";
            return handle.createQuery(sql).bind(0, parentId).mapToBean(Product.class).list();
        });
    }

    // 6. Tìm chi tiết theo ID (Trang Detail)
    public List<Product> findById(int id){
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle -> {
            String sql = "SELECT id AS product_id, product_name, price, detail_description, short_description, " +
                    "average_rating AS medium_rating, image_id " +
                    "FROM products WHERE id = ?";
            return handle.createQuery(sql).bind(0, id).mapToBean(Product.class).list();
        });
    }

    // 7. Lấy tất cả sản phẩm có sắp xếp (Dùng cho bộ lọc trang Product)
    public List<Product> findAllSorted(String sortType) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle -> {
            StringBuilder sql = new StringBuilder(
                    "SELECT p.id AS product_id, p.product_name, p.price, " +
                            "p.average_rating AS medium_rating, i.path AS thumbnail " +
                            "FROM products p " +
                            "LEFT JOIN images i ON p.image_id = i.id "
            );

            // Logic nối chuỗi SQL dựa trên loại sắp xếp
            switch (sortType) {
                case "price_asc":
                    sql.append("ORDER BY p.price ASC");
                    break;
                case "price_desc":
                    sql.append("ORDER BY p.price DESC");
                    break;
                case "newest":
                    sql.append("ORDER BY p.created_at DESC");
                    break;
                case "bestseller":
                    sql.append("ORDER BY p.average_rating DESC");
                    break;
                default:
                    // Mặc định sắp xếp theo ID hoặc tên
                    sql.append("ORDER BY p.id DESC");
                    break;
            }

            return handle.createQuery(sql.toString())
                    .mapToBean(Product.class)
                    .list();
        });
    }
    // 8. Tìm thông tin chi tiết sản phẩm
    public Product findProductDetailById(int id) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle -> {
            String sql = "SELECT id AS product_id, product_name, price, detail_description, " +
                    "short_description, average_rating AS medium_rating " +
                    "FROM products WHERE id = ?";
            return handle.createQuery(sql)
                    .bind(0, id)
                    .mapToBean(Product.class)
                    .findOne()
                    .orElse(null);
        });
    }

    // 9. Lấy danh sách ảnh (List<String>)
    public List<String> findImagesByProductId(int productId) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle -> {
            String sql = "SELECT path FROM images WHERE product_id = ?";
            return handle.createQuery(sql)
                    .bind(0, productId)
                    .mapTo(String.class)
                    .list();
        });
    }

    // 10. Lấy danh sách Variants
    public List<Variants> findVariantsByProductId(int productId) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle -> {
            String sql = "SELECT id, size, color, quantity FROM variants WHERE product_id = ?";
            return handle.createQuery(sql)
                    .bind(0, productId)
                    .map((rs, ctx) -> {
                        Variants v = new Variants();
                        v.setVariantId(rs.getInt("id"));
                        v.setSize(rs.getString("size"));
                        v.setColor(rs.getString("color"));
                        v.setQuantity(rs.getInt("quantity"));
                        return v;
                    })
                    .list();
        });
    }

}