package com.clothingshop.styleera.service;

import com.clothingshop.styleera.dao.ProductDAO;
import com.clothingshop.styleera.model.Product;

import java.util.List;

public class ServiceProduct {
    private ProductDAO productDAO = new ProductDAO();
    public List<Product> findAll(){
        return productDAO.findAll();
    }
    public Product findById(int id){
        return productDAO.findById(id).stream().findFirst().get();
    }

}