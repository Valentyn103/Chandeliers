package com.chandaliers.services;

import com.chandaliers.models.Firm;
import java.util.List;

public interface FirmService {


    public void addFirm(Firm firm);

    public void deleteFirm(Firm firm);

    public void editFirm(Firm firm);

    public Firm getFirmByID(int id);

    public List<Firm> loadFirmList();

    public Firm getFirmByName(String name);
}
