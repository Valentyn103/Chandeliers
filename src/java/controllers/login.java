package controllers;

import hibernate.Factory;
import models.usersTable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.portlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
@Controller
@SessionAttributes("user")
public class login {
//    @RequestMapping(value = "/login")
//    public ModelAndView login(HttpSession session) {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("LoginForm");
//        return modelAndView;
//    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam(value = "email") String email, @RequestParam(value = "password") String password,
                        ModelMap model, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        List<usersTable> a = Factory.getFactory().getusers().getAll();
        for (int i = 0; i < a.size(); i++)
            if (a.get(i).getEmail().equals(email) && a.get(i).getPassword().equals(password)) {
                session.setAttribute("email", email);
                session.setAttribute("status", a.get(i).getStatus());
                return "redirect:/";
            }
        return "redirect:/";
    }


}