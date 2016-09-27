package com.chandaliers.services;

import com.chandaliers.models.Style;

import java.util.List;

public interface StyleService {
    public void addStyle(Style color);

    public void deleteStyle(Style color);

    public void editStyle(Style color);

    public Style getStyleByID(int id);

    public List<Style> loadStyleList();

    public Style getStyleByName(String name);
}
