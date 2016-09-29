package com.chandaliers.controllers;

import com.chandaliers.models.Chandelier;
import com.chandaliers.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class Main {
    @Autowired
    ChandelierService chandelierService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    FirmService firmService;
    @Autowired
    OrderService orderService;

    @Autowired
    UserService userService;

    Integer minCost, maxCost, minPower, maxPower, minLamp, maxLamp;
    float minWidth, maxWidth, minHeight, maxHeight;
    @Autowired
    private ImageService imageService;

    @Autowired
    private CartridgeService cartridgeService;

    @Autowired
    private StyleService styleService;

    @Autowired
    private ColorService colorService;

    @Autowired
    private MaterialService materialService;

    @RequestMapping(value = "/")
    public ModelAndView main() {
        ModelAndView model = new ModelAndView();
        model.setViewName("Main");
        List<Chandelier> chandelierList = chandelierService.loadChandelierList();
        model.addObject("chandelier", chandelierList);

        if (chandelierList.size() != 0) {
            minCost = chandelierList.get(0).getUnitCost();
            maxCost = chandelierList.get(0).getUnitCost();
            minPower = chandelierList.get(0).getPower();
            maxPower = chandelierList.get(0).getPower();
            minLamp = chandelierList.get(0).getNumber_lamp();
            maxLamp = chandelierList.get(0).getNumber_lamp();
            minWidth = chandelierList.get(0).getWidth();
            maxWidth = chandelierList.get(0).getWidth();
            minHeight = chandelierList.get(0).getHeight();
            maxHeight = chandelierList.get(0).getHeight();
            for (Chandelier chandelier : chandelierList) {
                int cost = chandelier.getUnitCost(), power = chandelier.getPower(),
                        lamp = chandelier.getNumber_lamp();
                float width = chandelier.getWidth(), height = chandelier.getHeight();
                if (minCost > cost)
                    minCost = cost;
                if (maxCost < cost)
                    maxCost = cost;
                if (minPower > power)
                    minPower = power;
                if (maxPower < power)
                    maxPower = power;
                if (minLamp > lamp)
                    minLamp = lamp;
                if (maxLamp < lamp)
                    maxLamp = lamp;
                if (minWidth > width)
                    minWidth = width;
                if (maxWidth < width)
                    maxWidth = width;
                if (minHeight > height)
                    minHeight = height;
                if (maxHeight < height)
                    maxHeight = height;
            }
            model = fillMain(model);
        }
        return model;
    }

    @RequestMapping(value = "/filter", method = RequestMethod.POST)
    public ModelAndView filter(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        model.setViewName("Main");
        List<Chandelier> chandelierList = chandelierService.loadChandelierList();
        ArrayList<Chandelier> chanMain = new ArrayList<>(chandelierList);
        String categorys[] = request.getParameterValues("category");
        String firms[] = request.getParameterValues("firm");
        String styles[] = request.getParameterValues("style");
        String cartridges[] = request.getParameterValues("cartridge");
        String bodycolors[] = request.getParameterValues("bodycolor");
        String bodymaterials[] = request.getParameterValues("bodymaterial");
        String plafoncolors[] = request.getParameterValues("plafoncolor");
        String plafonmaterials[] = request.getParameterValues("plafonmaterial");
        String cost[] = request.getParameterValues("ex2")[0].split(",");
        String power[] = request.getParameterValues("ex3")[0].split(",");
        String lamp[] = request.getParameterValues("ex4")[0].split(",");
        String width[] = request.getParameterValues("ex5")[0].split(",");
        String height[] = request.getParameterValues("ex6")[0].split(",");
        int mincost = Integer.parseInt(cost[0]), maxcost = Integer.parseInt(cost[1]);
        int minpower = Integer.parseInt(power[0]), maxpower = Integer.parseInt(power[1]);
        int minlamp = Integer.parseInt(lamp[0]), maxlamp = Integer.parseInt(lamp[1]);
        int minwidth = Integer.parseInt(width[0]), maxwidth = Integer.parseInt(width[1]);
        int minheight = Integer.parseInt(height[0]), maxheight = Integer.parseInt(height[1]);
        Boolean ifDelete = true;
        for (Chandelier chandelier : chandelierList) {
            if (chandelier.getUnitCost() > maxcost || chandelier.getUnitCost() < mincost ||
                    chandelier.getPower() < minpower || chandelier.getPower() > maxpower ||
                    chandelier.getNumber_lamp() < minlamp || chandelier.getNumber_lamp() > maxlamp ||
                    chandelier.getWidth() < minwidth || chandelier.getWidth() > maxwidth ||
                    chandelier.getHeight() < minheight || chandelier.getHeight() > maxheight) {
                chanMain.remove(chandelier);
            } else {
                if (firms == null && categorys == null && styles == null && cartridges == null && bodycolors == null
                        && bodymaterials == null && plafoncolors == null && plafonmaterials == null)
                    ifDelete = false;
                else {
                    if (firms != null)
                        for (String firm : firms)
                            if (chandelier.getFirm().getName().equals(firm))
                                ifDelete = false;
                    if (ifDelete && categorys != null)
                        for (String category : categorys)
                            if (chandelier.getCategory().getName().equals(category))
                                ifDelete = false;
                    if (ifDelete && styles != null)
                        for (String style : styles)
                            if (chandelier.getStyle().getName().equals(style))
                                ifDelete = false;
                    if (ifDelete && cartridges != null)
                        for (String cartridge : cartridges)
                            if (chandelier.getCartridge().getName().equals(cartridge))
                                ifDelete = false;
                    if (ifDelete && bodycolors != null)
                        for (String bodycolor : bodycolors)
                            if (chandelier.getBodycolor().getName().equals(bodycolor))
                                ifDelete = false;
                    if (ifDelete && bodymaterials != null)
                        for (String bodymaterial : bodymaterials)
                            if (chandelier.getBodymaterial().getName().equals(bodymaterial))
                                ifDelete = false;
                    if (ifDelete && plafoncolors != null)
                        for (String plafoncolor : plafoncolors)
                            if (chandelier.getPlafoncolor().getName().equals(plafoncolor))
                                ifDelete = false;
                    if (ifDelete && plafonmaterials != null)
                        for (String plafonmaterial : plafonmaterials)
                            if (chandelier.getPlafonmaterial().getName().equals(plafonmaterial))
                                ifDelete = false;
                }
                if (ifDelete)
                    chanMain.remove(chandelier);
            }
            ifDelete = true;
        }
        if (chanMain.size() != 0)
            model.addObject("chandelier", chanMain);
        else
            model.addObject("info", "<h1>По заданным параметрам не найдена ни одна модель</h1>");
        model = fillMain(model);
        return model;
    }

    @RequestMapping(value = "/find", method = RequestMethod.POST)
    public ModelAndView filter(@RequestParam(value = "find") String find) {
        ModelAndView model = new ModelAndView();
        model.setViewName("Main");
        List<Chandelier> chandelierList = chandelierService.loadChandelierList();
        ArrayList<Chandelier> chanMain = new ArrayList<>();
        for (Chandelier chandelier : chandelierList) {
            if (chandelier.getArticle().toLowerCase().contains(find.toLowerCase())
                    || chandelier.getFirm().getName().toLowerCase().contains(find.toLowerCase())
                    || chandelier.getCategory().getName().toLowerCase().contains(find.toLowerCase()))
                chanMain.add(chandelier);
        }
        if (chanMain.size() != 0)
            model.addObject("chandelier", chanMain);
        else
            model.addObject("info", "<h1>По заданным параметрам не найдена ни одна модель</h1>");
        model = fillMain(model);
        return model;
    }

    private ModelAndView fillMain(ModelAndView model) {
        model.addObject("minCost", minCost);
        model.addObject("maxCost", maxCost);
        model.addObject("minPower", minPower);
        model.addObject("maxPower", maxPower);
        model.addObject("minLamp", minLamp);
        model.addObject("maxLamp", maxLamp);
        model.addObject("minWidth", minWidth);
        model.addObject("maxWidth", maxWidth);
        model.addObject("minHeight", minHeight);
        model.addObject("maxHeight", maxHeight);
        model.addObject("category", categoryService.loadCategoriesList());
        model.addObject("imageService", imageService);
        model.addObject("firm", firmService.loadFirmList());
        model.addObject("cartridge", cartridgeService.loadCartridgeList());
        model.addObject("style", styleService.loadStyleList());
        model.addObject("color", colorService.loadColorList());
        model.addObject("material", materialService.loadMaterialList());
        model = CartController.getCart(model, userService);
        return model;
    }

    @RequestMapping(value = "/delivery")
    public ModelAndView delivery() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("delivery");
        modelAndView = CartController.getCart(modelAndView, userService);
        modelAndView.addObject("imageService", imageService);
        return modelAndView;
    }
    @RequestMapping(value = "/shops")
    public ModelAndView shops() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("shops");
        modelAndView = CartController.getCart(modelAndView, userService);
        modelAndView.addObject("imageService", imageService);
        return modelAndView;
    }
    @RequestMapping(value = "/company")
    public ModelAndView company() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("company");
        modelAndView = CartController.getCart(modelAndView, userService);
        modelAndView.addObject("imageService", imageService);
        return modelAndView;
    }
    @RequestMapping(value = "/payment")
    public ModelAndView payment() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("payment");
        modelAndView = CartController.getCart(modelAndView, userService);
        modelAndView.addObject("imageService", imageService);
        return modelAndView;
    }
}