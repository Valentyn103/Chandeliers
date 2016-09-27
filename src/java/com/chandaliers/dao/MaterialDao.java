package com.chandaliers.dao;

import com.chandaliers.models.Material;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MaterialDao  extends JpaRepository<Material, Integer> {
    Material findByName(String name);

}
