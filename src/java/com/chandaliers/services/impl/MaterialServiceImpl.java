package com.chandaliers.services.impl;

import com.chandaliers.dao.MaterialDao;
import com.chandaliers.models.Material;
import com.chandaliers.services.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MaterialServiceImpl  implements MaterialService {

    @Autowired
    private MaterialDao materialDao;

    @Override
    public void addMaterial(Material material) {
            materialDao.saveAndFlush(material);
    }

    @Override
    public void deleteMaterial(Material material) {
        materialDao.delete(material);
    }

    @Override
    public void editMaterial(Material material) {
        materialDao.saveAndFlush(material);
    }

    @Override
    public Material getMaterialByID(int id) {
        return materialDao.findOne(id);
    }

    @Override
    public List<Material> loadMaterialList() {
        return materialDao.findAll();
    }

    @Override
    public Material getMaterialByName(String name) {
        return materialDao.findByName(name);
    }
}
