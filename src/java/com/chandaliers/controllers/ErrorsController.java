package com.chandaliers.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorsController {
    @RequestMapping(value = "/404")
    public String error404(){
        System.out.println("This is 404");
        return "redirect:/";
    }
}
