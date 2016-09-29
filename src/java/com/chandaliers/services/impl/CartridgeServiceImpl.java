package com.chandaliers.services.impl;

import com.chandaliers.dao.CartridgeDao;
import com.chandaliers.models.Cartridge;
import com.chandaliers.services.CartridgeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class CartridgeServiceImpl implements CartridgeService {

    @Autowired
    private CartridgeDao cartridgeDao;

    @Override
    public void addCartridge(Cartridge cartridge) {
        cartridgeDao.saveAndFlush(cartridge);
    }

    @Override
    public void deleteCartridge(Cartridge cartridge) {
            cartridgeDao.delete(cartridge);
    }

    @Override
    public void editCartridge(Cartridge cartridge) {
            cartridgeDao.saveAndFlush(cartridge);
    }

    @Override
    public Cartridge getCartridgeByID(int id) {
        return cartridgeDao.findOne(id);
    }

    @Override
    public List<Cartridge> loadCartridgeList() {
        return cartridgeDao.findAll();
    }

    @Override
    public Cartridge getCartridgeByName(String name) {
        return cartridgeDao.findByName(name);
    }
}