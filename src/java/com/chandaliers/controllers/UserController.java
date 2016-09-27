package com.chandaliers.controllers;

import com.chandaliers.models.User;
import com.chandaliers.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
    @Autowired
    private UserService service;
    @RequestMapping(value = "/register")
    public ModelAndView register() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("RegisterForm");
        return modelAndView;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String addUserAction(
            @RequestParam(value = "UserRePassword") String repassword, @RequestParam(value = "name") String name,
            @RequestParam(value = "UserPassword") String password,
            @RequestParam(value = "email") String email, @RequestParam(value = "number") String number) {
        if (password.equals(repassword)) {
            User user = new User();
            user.setPassword(password);
            user.setEmail(email);
            user.setNumber(number);
            user.setName(name);
            user.setRole_id(2);
            service.addUser(user);
        }
         return "redirect:/";
    }
}
