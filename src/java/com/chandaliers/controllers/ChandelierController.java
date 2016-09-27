package com.chandaliers.controllers;

import com.chandaliers.models.Category;
import com.chandaliers.models.Chandelier;
import com.chandaliers.models.Firm;
import com.chandaliers.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class ChandelierController {
    @Autowired
    private ChandelierService service;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private FirmService firmService;

    @Autowired
    private UserService userService;

    @Autowired
    private ImageService imageService;

    @RequestMapping(value = "/admin/addchan")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView main(HttpSession session) {
        ModelAndView model = new ModelAndView();
        model.setViewName("Admin/chandelierAdd");
        model.addObject("category", categoryService.loadCategoriesList());
        model.addObject("firm", firmService.loadFirmList());

        return model;
    }

    @RequestMapping(value = "/admin/addchan", method = RequestMethod.POST)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String ChandelierAdd(@RequestParam(value = "articul") String articul,
                                @RequestParam(value = "unitcost") Integer unitcost,
                                @RequestParam(value = "height") float height,
                                @RequestParam(value = "width") float width,
                                @RequestParam(value = "lamps") Integer lamps,
                                @RequestParam(value = "power") Integer power,
                                @RequestParam(value = "info") String info,
                                @RequestParam(value = "category") String category,
                                @RequestParam(value = "firm") String firm,
                                @RequestParam(value = "file") MultipartFile imgFile
    ) {
        Category category1 = categoryService.getCategoryByName(category);
        Firm firm1 = firmService.getFirmByName(firm);
        Chandelier chandelier = new Chandelier();
        chandelier.setArticle(articul);
        chandelier.setUnitCost(unitcost);
        chandelier.setHeight(height);
        chandelier.setWidth(width);
        chandelier.setNumber_lamp(lamps);
        chandelier.setPower(power);
        chandelier.setInfo(info);
        chandelier.setCategory(category1);
        chandelier.setFirm(firm1);
        String fileName = imageService.uploadImage(imgFile);
        chandelier.setImage(fileName);
        service.addChandelier(chandelier);
        return "redirect:/admin/addchan";
    }

    @RequestMapping(value = "/chandelier/{article}", method = RequestMethod.GET)
    public ModelAndView details(@PathVariable("article") String article) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/details");
        Chandelier chandelier = service.getChandelierByArticle(article);
        modelAndView.addObject("article", chandelier.getArticle());
        modelAndView.addObject("unitcost", chandelier.getUnitCost());
        modelAndView.addObject("height", chandelier.getHeight());
        modelAndView.addObject("width", chandelier.getWidth());
        modelAndView.addObject("power", chandelier.getPower());
        modelAndView.addObject("image", imageService.generateImageUrl(chandelier));
        modelAndView.addObject("lamps", chandelier.getNumber_lamp());
        Category category = chandelier.getCategory();
        Firm firm = chandelier.getFirm();
        modelAndView.addObject("category", category.getName());
        modelAndView.addObject("firm", firm.getName());
        modelAndView.addObject("info", chandelier.getInfo());
        modelAndView = CartController.getCart(modelAndView,userService);
        modelAndView.addObject("imageService",imageService);
        return modelAndView;
    }
}
