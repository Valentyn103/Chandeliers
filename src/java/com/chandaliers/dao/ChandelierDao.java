package com.chandaliers.dao;

import com.chandaliers.models.Chandelier;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChandelierDao  extends JpaRepository<Chandelier, Integer> {
    Chandelier findByArticle(String article);

}
