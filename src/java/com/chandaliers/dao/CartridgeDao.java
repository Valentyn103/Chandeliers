package com.chandaliers.dao;

import com.chandaliers.models.Cartridge;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartridgeDao  extends JpaRepository<Cartridge, Integer> {
    Cartridge findByName(String name);

}
