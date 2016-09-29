package com.chandaliers.services;

import com.chandaliers.models.Color;

import java.util.List;

public interface ColorService {

    public void addColor(Color color);

    public void deleteColor(Color color);

    public void editColor(Color color);

    public Color getColorByID(int id);

    public List<Color> loadColorList();

    public Color getColorByName(String name);
}
