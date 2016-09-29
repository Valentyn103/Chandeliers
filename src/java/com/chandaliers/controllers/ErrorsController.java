package com.chandaliers.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorsController {
    @RequestMapping(value = "/404")
    public ModelAndView error404(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Error");
        modelAndView.addObject("error","Страница не найдена");
        modelAndView.addObject("number","404");
        return modelAndView;
    }
    @RequestMapping(value = "/401")
    public ModelAndView error401(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Error");
        modelAndView.addObject("error","Пожалуйста, авторизуйтесь с правильними параметрами");
        modelAndView.addObject("number","401");
        return modelAndView;
    }
    @RequestMapping(value = "/403")
    public ModelAndView error403(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Error");
        modelAndView.addObject("error","У вас нет прав доступа");
        modelAndView.addObject("number","403");
        return modelAndView;
    }
    @RequestMapping(value = "/500")
    public ModelAndView error500(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Error");
        modelAndView.addObject("error","Не правильно введение параметры или эта запись уже существует");
        modelAndView.addObject("number","500");
        return modelAndView;
    }
}
