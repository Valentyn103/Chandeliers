package com.chandaliers.services;

import com.chandaliers.models.Cartridge;

import java.util.List;

public interface CartridgeService {

    public void addCartridge(Cartridge cartridge);

    public void deleteCartridge(Cartridge cartridge);

    public void editCartridge(Cartridge cartridge);

    public Cartridge getCartridgeByID(int id);

    public List<Cartridge> loadCartridgeList();

    public Cartridge getCartridgeByName(String name);
}
