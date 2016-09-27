package com.chandaliers.services.impl;

import com.chandaliers.dao.ChandelierDao;
import com.chandaliers.models.Chandelier;
import com.chandaliers.services.ChandelierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ChandelierServiceImpl implements ChandelierService {

    @Autowired
    private ChandelierDao chandelierDao;

    @Override
    public void addChandelier(Chandelier chandelier) {
        chandelierDao.saveAndFlush(chandelier);
    }

    @Override
    public void deleteChandelier(Chandelier chandelier) {
        chandelierDao.delete(chandelier);
    }

    @Override
    public void editChandelier(Chandelier chandelier) {
        chandelierDao.saveAndFlush(chandelier);
    }

    @Override
    public Chandelier getChandelierByID(int id) {
        return chandelierDao.findOne(id);
    }

    @Override
    public List<Chandelier> loadChandelierList() {
        return chandelierDao.findAll();
    }

    @Override
    public Chandelier getChandelierByArticle(String article) {
        return chandelierDao.findByArticle(article);
    }
}