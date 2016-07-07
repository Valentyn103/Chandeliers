package controllers;

import hibernate.Factory;
import models.usersTable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
@Controller
@SessionAttributes("user")
public class register {
    @RequestMapping(value = "/register")
    public ModelAndView register() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("RegisterForm");
        return modelAndView;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(@RequestParam(value = "password") String password,
                                 @RequestParam(value = "repassword") String repassword, @RequestParam(value = "name") String name,
                                 @RequestParam(value = "email") String email, @RequestParam(value = "number") String number) {
        ModelAndView model = new ModelAndView();
        if (password.equals(repassword)) {
            model.setViewName("LoginForm");
            usersTable user = new usersTable();
            user.setPassword(password);
            user.setEmail(email);
            user.setNumber(number);
            user.setName(name);
            user.setStatus(0);
            Factory.getFactory().getusers().add(user);
        } else
            model.setViewName("RegisterForm");
        return model;
    }
}
