package com.chandaliers.services.impl;


import com.chandaliers.dao.FirmDao;
import com.chandaliers.models.Firm;
import com.chandaliers.services.FirmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class FirmServiceImpl implements FirmService {

    @Autowired
    private FirmDao firmDao;

    @Override
    public void addFirm(Firm firm) {
        firmDao.saveAndFlush(firm);
    }

    @Override
    public void deleteFirm(Firm firm) {
        firmDao.delete(firm);
    }

    @Override
    public void editFirm(Firm firm) {
        firmDao.saveAndFlush(firm);
    }

    @Override
    public Firm getFirmByID(int id) {
        return firmDao.findOne(id);
    }

    @Override
    public List<Firm> loadFirmList() {
        return firmDao.findAll();
    }
    @Override
    public Firm getFirmByName(String name) {
        return firmDao.findByName(name);
    }
}