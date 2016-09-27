package com.chandaliers.dao;

import com.chandaliers.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryDao  extends JpaRepository<Category, Integer> {
    Category findByName(String name);

}
