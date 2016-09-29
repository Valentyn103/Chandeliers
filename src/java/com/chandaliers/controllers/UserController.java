package com.chandaliers.controllers;

import com.chandaliers.models.User;
import com.chandaliers.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
        else
            return "redirect:/500";
        return "redirect:/";
    }

    @RequestMapping(value = "/users/all")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView users() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Admin/userAll");
        modelAndView.addObject("users", service.loadUsersList());
        return modelAndView;
    }

    @RequestMapping(value = "/users/orders/{userId}", method = RequestMethod.GET)
    public ModelAndView details(@PathVariable("userId") Integer userId) {
        User user = service.getById(userId);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Admin/ordersAll");
        modelAndView.addObject("orderList", user.getOrders());
        return modelAndView;
    }

    @RequestMapping(value = "/personal")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ModelAndView personal() {
        ModelAndView modelAndView = new ModelAndView();
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = service.getByEmail(email);
        if(user.getOrders().size()!= 0)
        modelAndView.addObject("orderList",user.getOrders());
        else
            modelAndView.addObject("auth","<h3 style=\"margin-top:0px; margin-botton: 0px;\">К сожалению, ваш список заказов пуст.</h3>");
        modelAndView.addObject("name",user.getName());
        modelAndView.addObject("email",user.getEmail());
        modelAndView.addObject("number",user.getNumber());
        return modelAndView;
    }
    @RequestMapping(value = "/user/edit", method = RequestMethod.POST)
    @PreAuthorize("hasRole('ROLE_USER')")
    public String userEdit(@RequestParam(value = "name") String name,
                                    @RequestParam(value = "email") String email, @RequestParam(value = "number") String number) {
        String email_old = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = service.getByEmail(email_old);
        user.setEmail(email);
        user.setName(name);
        user.setNumber(number);
        service.editUser(user);
        return "redirect: /personal";
    }
    @RequestMapping(value = "/user/editpass", method = RequestMethod.POST)
    @PreAuthorize("hasRole('ROLE_USER')")
    public String userEditpass(   @RequestParam(value = "UserRePassword") String repassword,
                                  @RequestParam(value = "UserPassword") String password) {
        String email_old = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = service.getByEmail(email_old);
        if(password.equals(repassword))
        {
            user.setPassword(password);
            service.editUser(user);
        }
        return "redirect: /personal";
    }
}