package com.chandaliers.dao;

import com.chandaliers.models.Firm;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FirmDao  extends JpaRepository<Firm, Integer> {
    Firm findByName(String name);

}
