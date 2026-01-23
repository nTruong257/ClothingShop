package com.clothingshop.styleera.dao;

import com.clothingshop.styleera.model.ParentCategory;
import com.clothingshop.styleera.model.SubCategory;
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
    public List<Product> findAll() {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle -> {
            String sql = "SELECT p.id AS product_id, p.product_name, p.price, " +
                    "sc.id AS sub_id, sc.sub_name, sc.category_parent_id, " +
                    "pc.id AS parent_id, pc.parent_name, " +
                    "i.path AS thumbnail " +
                    "FROM products p " +
                    "LEFT JOIN subcategories sc ON p.category_sub_id = sc.id " +
                    "LEFT JOIN parentcategories pc ON sc.category_parent_id = pc.id " +
                    "LEFT JOIN images i ON p.image_id = i.id";

            return handle.createQuery(sql)
                    .map((rs, ctx) -> {
                        // Tạo ParentCategory
                        ParentCategory parent = null;
                        int parentId = rs.getInt("parent_id");
                        if (parentId != 0) {  // Kiểm tra NULL
                            parent = new ParentCategory(
                                    parentId,
                                    rs.getString("parent_name")
                            );
                        }

                        // Tạo SubCategory
                        SubCategory subcat = null;
                        int subId = rs.getInt("sub_id");
                        if (subId != 0) {
                            subcat = new SubCategory(
                                    subId,
                                    rs.getString("sub_name"),
                                    rs.getInt("category_parent_id"),
                                    null,
                                    null
                            );
                            subcat.setCategory(parent);
                        }

                        // Tạo Product
                        Product product = new Product();
                        product.setProduct_id(rs.getInt("product_id"));
                        product.setProduct_name(rs.getString("product_name"));
                        product.setPrice(rs.getDouble("price"));
                        product.setThumbnail(rs.getString("thumbnail"));
                        product.setSubcategories(subcat);

                        List<Variants> variants = findVariantsByProductId(rs.getInt("product_id"));
                        product.setVariants(variants);
                        return product;
                    })
                    .list();
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
    // 11 lay san pham lien quan
    public List<Product> findRelatedProducts(int subId, int prodId) {
        return JDBIConnector.getJdbi().withHandle(handle -> {
            // SQL lấy ngẫu nhiên 4 sản phẩm, trừ sản phẩm hiện tại đang xem
            String sql = "SELECT p.id, p.product_name, p.price, i.path AS thumbnail_path " +
                    "FROM products p " +
                    "JOIN images i ON p.image_id = i.id " +
                    "WHERE p.id != :prodId ORDER BY RAND() LIMIT 4";

            return handle.createQuery(sql)
                    .bind("prodId", prodId)
                    .map((rs, ctx) -> {
                        Product p = new Product();
                        p.setProduct_id(rs.getInt("id"));
                        p.setProduct_name(rs.getString("product_name"));
                        p.setPrice(rs.getDouble("price"));
                        // PHẢI LÀ "thumbnail_path" vì bạn đặt Alias trong SQL là thumbnail_path
                        p.setThumbnail(rs.getString("thumbnail_path"));
                        return p;
                    }).list();
        });
    }
    //12. lọc theo Danh Mục
    public List<Product> filterParentCategory(String parentName) {
        return JDBIConnector.getJdbi().withHandle(h -> {

            String sql =
                    "SELECT p.id AS product_id, p.product_name, p.price, " +
                            "sc.id AS sub_id, sc.sub_name, sc.category_parent_id, " +
                            "pc.id AS parent_id, pc.parent_name, " +
                            "i.path AS thumbnail " +
                            "FROM products p " +
                            "JOIN subcategories sc ON p.category_sub_id = sc.id " +
                            "JOIN parentcategories pc ON sc.category_parent_id = pc.id " +
                            "LEFT JOIN images i ON p.image_id = i.id " +
                            "WHERE pc.parent_name = :parentName";

            return h.createQuery(sql)
                    .bind("parentName", parentName)
                    .map((rs, ctx) -> {
                        // Tạo ParentCategory
                        ParentCategory parent = null;
                        int parentId = rs.getInt("parent_id");
                        if (parentId != 0) {
                            parent = new ParentCategory(
                                    parentId,
                                    rs.getString("parent_name")
                            );
                        }

                        // Tạo SubCategory
                        SubCategory subcat = null;
                        int subId = rs.getInt("sub_id");
                        if (subId != 0) {
                            subcat = new SubCategory(
                                    subId,
                                    rs.getString("sub_name"),
                                    rs.getInt("category_parent_id"),
                                    null,
                                    null
                            );
                            subcat.setCategory(parent);
                        }

                        // Tạo Product
                        Product product = new Product();
                        product.setProduct_id(rs.getInt("product_id"));
                        product.setProduct_name(rs.getString("product_name"));
                        product.setPrice(rs.getDouble("price"));
                        product.setThumbnail(rs.getString("thumbnail"));
                        product.setSubcategories(subcat);

                        List<Variants> variants = findVariantsByProductId(rs.getInt("product_id"));
                        product.setVariants(variants);
                        return product;
                    })
                    .list();
        });
    }


}