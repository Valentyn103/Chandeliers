package com.chandaliers.controllers;

import com.chandaliers.models.Category;
import com.chandaliers.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    private CategoryService service;

    @RequestMapping("get-categories")
    public
    @ResponseBody
    List<Category> getCategories() {
        return service.loadCategoriesList();
    }


    @RequestMapping(value = "/categoryadd", method = RequestMethod.POST)
    public String categoryadd(@RequestParam(value = "nameCategory") String name) {
        Category category = new Category();
        category.setName(name);
        service.addCategory(category);
        return "redirect:/chandelieradd";

    }
}
