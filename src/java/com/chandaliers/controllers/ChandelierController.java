package com.chandaliers.controllers;

import com.chandaliers.models.*;
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

    @Autowired
    private CartridgeService cartridgeService;

    @Autowired
    private StyleService styleService;

    @Autowired
    private ColorService colorService;

    @Autowired
    private MaterialService materialService;
    @RequestMapping(value = "/admin/addchan")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView main(HttpSession session) {
        ModelAndView model = new ModelAndView();
        model.setViewName("Admin/chandelierAdd");
        model.addObject("category", categoryService.loadCategoriesList());
        model.addObject("firm", firmService.loadFirmList());
        model.addObject("cartridge",cartridgeService.loadCartridgeList());
        model.addObject("style",styleService.loadStyleList());
        model.addObject("color",colorService.loadColorList());
        model.addObject("material",materialService.loadMaterialList());
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
                                @RequestParam(value = "cartridge") String cartridge,
                                @RequestParam(value = "style") String style,
                                @RequestParam(value = "bodycolor") String bodycolor,
                                @RequestParam(value = "bodymaterial") String bodymaterial,
                                @RequestParam(value = "plafoncolor") String plafoncolor,
                                @RequestParam(value = "plafonmaterial") String plafonmaterial,
                                @RequestParam(value = "file") MultipartFile imgFile
    ) {
        Category category1 = categoryService.getCategoryByName(category);
        Firm firm1 = firmService.getFirmByName(firm);
        Style style1 = styleService.getStyleByName(style);
        Cartridge cartridge1 = cartridgeService.getCartridgeByName(cartridge);
        Color bodyColor1 = colorService.getColorByName(bodycolor);
        Material bodymaterial1 = materialService.getMaterialByName(bodymaterial);
        Color plafonColor1 = colorService.getColorByName(plafoncolor);
        Material plafonMaterial1 = materialService.getMaterialByName(plafonmaterial);
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
        chandelier.setCartridge(cartridge1);
        chandelier.setStyle(style1);
        chandelier.setBodycolor(bodyColor1);
        chandelier.setBodymaterial(bodymaterial1);
        chandelier.setPlafoncolor(plafonColor1);
        chandelier.setPlafonmaterial(plafonMaterial1);
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
        modelAndView.addObject("style",chandelier.getStyle().getName());
        modelAndView.addObject("cartridge",chandelier.getCartridge().getName());
        modelAndView.addObject("bodycolor",chandelier.getBodycolor().getName());
        modelAndView.addObject("bodymaterial",chandelier.getBodymaterial().getName());
        modelAndView.addObject("plafoncolor",chandelier.getPlafoncolor().getName());
        modelAndView.addObject("plafonmaterial",chandelier.getPlafonmaterial().getName());

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
