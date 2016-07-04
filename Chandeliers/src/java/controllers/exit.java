package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class exit {
    @RequestMapping(value = "/exit")
    public String exit(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
