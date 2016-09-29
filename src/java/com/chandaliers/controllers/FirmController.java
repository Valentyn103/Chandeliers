package com.chandaliers.controllers;

import com.chandaliers.models.Firm;
import com.chandaliers.services.FirmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FirmController {
    @Autowired
    private FirmService service;

    @RequestMapping(value = "/firmadd", method = RequestMethod.POST)
    public String addFirm(@RequestParam(value = "nameFirm") String name) {
        Firm firm = new Firm();
        firm.setName(name);
        service.addFirm(firm);
        return "redirect:/admin/addchan";
    }
}
