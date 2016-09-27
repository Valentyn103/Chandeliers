package com.chandaliers.dao;

import com.chandaliers.models.Style;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StyleDao  extends JpaRepository<Style, Integer> {
    Style findByName(String name);

}
