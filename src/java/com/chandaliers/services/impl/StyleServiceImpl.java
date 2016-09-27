package com.chandaliers.services.impl;

import com.chandaliers.dao.StyleDao;
import com.chandaliers.models.Style;
import com.chandaliers.services.StyleService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class StyleServiceImpl implements StyleService {

    @Autowired
    private StyleDao styleDao;

    @Override
    public void addStyle(Style color) {
        styleDao.saveAndFlush(color);
    }

    @Override
    public void deleteStyle(Style color) {
        styleDao.delete(color);
    }

    @Override
    public void editStyle(Style color) {
        styleDao.saveAndFlush(color);
    }

    @Override
    public Style getStyleByID(int id) {
        return styleDao.findOne(id);
    }

    @Override
    public List<Style> loadStyleList() {
        return styleDao.findAll();
    }

    @Override
    public Style getStyleByName(String name) {
        return styleDao.findByName(name);
    }
}