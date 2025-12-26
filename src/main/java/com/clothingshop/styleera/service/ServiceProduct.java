package com.clothingshop.styleera.service;

import com.clothingshop.styleera.dao.ProductDAO;
import com.clothingshop.styleera.model.Product;
import com.clothingshop.styleera.model.Variants;
import java.util.List;

public class ServiceProduct {
    private final ProductDAO productDAO = new ProductDAO();

    public List<Product> findAll(){
        return productDAO.findAll();
    }

    public Product findById(int id){
        // Xử lý an toàn hơn để tránh lỗi nếu không tìm thấy ID
        List<Product> list = productDAO.findById(id);
        return list.isEmpty() ? null : list.get(0);
    }

    public List<Product> findBySubCategoryId(int subId) {
        return productDAO.findBySubCategoryId(subId);
    }

    public List<Product> findByParentCategoryId(int parentId) {
        return productDAO.findByParentCategoryId(parentId);
    }

    public List<Product> findNewArrivals() {
        return productDAO.findNewArrivals();
    }

    public List<Product> findBestSellers() {
        return productDAO.findBestSellers();
    }

    public List<String> getImagesByProductId(int id) {return productDAO.findImagesByProductId(id);}

    public List<Variants> getVariantsByProductId(int id) {return productDAO.findVariantsByProductId(id);}

    public List<Product> getRelatedProducts(int subId, int prodId) {return productDAO.findRelatedProducts(subId, prodId);
    }
    public Product getProductDetail(int productId) {return productDAO.findProductDetailById(productId);
    }
    }
