package com.chandaliers.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
    @RequestMapping(value = "/admin")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView main(HttpSession session) {

        ModelAndView model = new ModelAndView();
        model.setViewName("Admin/Admin");
        return model;
    }
}
