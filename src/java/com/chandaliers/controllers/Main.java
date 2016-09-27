package com.chandaliers.controllers;

import com.chandaliers.models.Chandelier;
import com.chandaliers.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @RequestMapping(value = "/")
    public ModelAndView main() {
        ModelAndView model = new ModelAndView();
        model.setViewName("Main");
        List<Chandelier> chandelierList = chandelierService.loadChandelierList();
        model.addObject("chandelier", chandelierList);
        model.addObject("imageService", imageService);
        model.addObject("category", categoryService.loadCategoriesList());
        model.addObject("firm", firmService.loadFirmList());
        //      minCost = chandelierList.stream().map(chandelier -> chandelier.getUnitCost())
        //              .mapToInt(Integer::intValue).min().getAsInt();

//        maxCost = chandelierList.stream().map(chandelier -> chandelier.getUnitCost())
//                .mapToInt(Integer::intValue).max().getAsInt();
//        minPower = chandelierList.stream().map(chandelier -> chandelier.getPower())
//                .mapToInt(Integer::intValue).min().getAsInt();
//        maxPower = chandelierList.stream().map(chandelier -> chandelier.getPower())
//                .mapToInt(Integer::intValue).max().getAsInt();
//        minLamp = chandelierList.stream().map(chandelier -> chandelier.getNumber_lamp())
//                .mapToInt(Integer::intValue).min().getAsInt();
//        maxLamp = chandelierList.stream().map(chandelier -> chandelier.getNumber_lamp())
//                .mapToInt(Integer::intValue).max().getAsInt();
//        minWidth = (float) chandelierList.stream().map(chandelier -> chandelier.getWidth())
//                .mapToDouble(Float::floatValue).min().getAsDouble();
//        maxWidth = (float) chandelierList.stream().map(chandelier -> chandelier.getWidth())
//                .mapToDouble(Float::floatValue).max().getAsDouble();
//        minHeight = (float) chandelierList.stream().map(chandelier -> chandelier.getHeight())
//                .mapToDouble(Float::floatValue).min().getAsDouble();
//        maxHeight = (float) chandelierList.stream().map(chandelier -> chandelier.getHeight())
//                .mapToDouble(Float::floatValue).max().getAsDouble();

        if(chandelierList.size()!=0) {
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
            model = CartController.getCart(model, userService);
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
                    chandelier.getPower() < minpower || chandelier.getPower() > maxpower &&
                    chandelier.getNumber_lamp() < minlamp || chandelier.getNumber_lamp() > maxlamp ||
                    chandelier.getWidth() < minwidth || chandelier.getWidth() > maxwidth ||
                    chandelier.getHeight() < minheight || chandelier.getHeight() > maxheight) {
                chanMain.remove(chandelier);
            } else {
                if (firms == null && categorys == null)
                    ifDelete = false;
                else {
                    if (firms != null) {
                        for (String firm : firms) {
                            if (chandelier.getFirm().getName().equals(firm))
                                ifDelete = false;
                        }
                    }
                    if (ifDelete == true && categorys != null) {
                        for (String category : categorys) {
                            if (chandelier.getCategory().getName().equals(category))
                                ifDelete = false;
                        }
                    }
                }
                if (ifDelete == true)
                    chanMain.remove(chandelier);
            }
            ifDelete = true;
        }
        if (chanMain.size() != 0)
            model.addObject("chandelier", chanMain);
        else
            model.addObject("info", "<h1>По заданным параметрам не найдена ни одна модель</h1>");
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
        return model;
    }
}