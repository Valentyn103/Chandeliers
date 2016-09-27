package com.chandaliers.services.impl;

import com.chandaliers.dao.CategoryDao;
import com.chandaliers.models.Category;
import com.chandaliers.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;

    @Override
    public void addCategory(Category category) {
        categoryDao.saveAndFlush(category);
    }

    @Override
    public void deleteCategory(Category category) {
        categoryDao.delete(category);
    }

    @Override
    public void editCategory(Category category) {
        categoryDao.saveAndFlush(category);
    }

    @Override
    public Category getCategoryByID(int id) {
        return categoryDao.findOne(id);
    }

    @Override
    public List<Category> loadCategoriesList() {
        return categoryDao.findAll();
    }

    @Override
    public Category getCategoryByName(String name){
        return categoryDao.findByName(name);
    }
}
