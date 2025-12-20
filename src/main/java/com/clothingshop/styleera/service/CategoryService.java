package com.clothingshop.styleera.service;

import com.clothingshop.styleera.dao.CategoryDAO;
import com.clothingshop.styleera.model.ParentCategory;

import java.util.List;

public class CategoryService {
    private CategoryDAO categoryDAO = new CategoryDAO();

    public List<ParentCategory> getAllCategories() {
        return categoryDAO.getAllParentCategoriesWithSubs();
    }
}
