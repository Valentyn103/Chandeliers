package com.chandaliers.services;

import com.chandaliers.models.Chandelier;

import java.util.List;

public interface ChandelierService {


    public void addChandelier(Chandelier chandelier);

    public void deleteChandelier(Chandelier chandelier);

    public void editChandelier(Chandelier chandelier);

    public Chandelier getChandelierByID(int id);

    public List<Chandelier> loadChandelierList();

    public Chandelier getChandelierByArticle(String article);
}
