package com.chandaliers.services;

import com.chandaliers.models.Material;

import java.util.List;

public interface MaterialService {

    public void addMaterial(Material material);

    public void deleteMaterial(Material material);

    public void editMaterial(Material material);

    public Material getMaterialByID(int id);

    public List<Material> loadMaterialList();

    public Material getMaterialByName(String name);
}
