package com.chandaliers.services;

import com.chandaliers.models.Category;

import java.util.List;

public interface CategoryService {


    public void addCategory(Category category);

    public void deleteCategory(Category category);

    public void editCategory(Category category);

    public Category getCategoryByID(int id);

    public List<Category> loadCategoriesList();

    public Category getCategoryByName(String name);
}
