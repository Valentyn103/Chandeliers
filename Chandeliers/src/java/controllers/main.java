package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes("user")
public class main {
    @RequestMapping(value = "/")
    public ModelAndView main(HttpSession session) {
        ModelAndView model1 = new ModelAndView();
        model1.setViewName("main");
        return model1;
    }
}
