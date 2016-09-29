package com.chandaliers.services.impl;

import com.chandaliers.dao.ColorDao;
import com.chandaliers.models.Color;
import com.chandaliers.services.ColorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class ColorServiceImpl implements ColorService {

    @Autowired
    private ColorDao colorDao;


    @Override
    public void addColor(Color color) {
        colorDao.saveAndFlush(color);
    }

    @Override
    public void deleteColor(Color color) {
        colorDao.delete(color);
    }

    @Override
    public void editColor(Color color) {
        colorDao.saveAndFlush(color);
    }

    @Override
    public Color getColorByID(int id) {
        return colorDao.findOne(id);
    }

    @Override
    public List<Color> loadColorList() {
        return colorDao.findAll();
    }

    @Override
    public Color getColorByName(String name) {
        return colorDao.findByName(name);
    }
}