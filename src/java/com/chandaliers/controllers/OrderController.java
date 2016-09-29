package com.chandaliers.controllers;

import com.chandaliers.models.*;
import com.chandaliers.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private ChandelierService chandelierService;

    @Autowired
    private UserService userService;

    @Autowired
    private ImageService imageService;
//
//1 - Оформлення
//2 - Очікування
//3 - Завершення
//4 - Відміна

    @RequestMapping(value = "/buy/{article}", method = RequestMethod.POST)
    @PreAuthorize("hasRole('ROLE_USER')")
    public ModelAndView buy(@PathVariable("article") String article, @RequestParam(value = "quantity") Integer quantity) {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.getByEmail(email);
        Chandelier chandelier = chandelierService.getChandelierByArticle(article);
        List<Order> orderList = new ArrayList<>(user.getOrders());
        Order order = null;
        for (int i = 0; i < orderList.size(); i++) {
            if (orderList.get(i).getStatus() == 1) {
                order = orderList.get(i);
                break;
            }
        }
        if (order == null) {
            order = new Order();
            order.setUser(user);
            order.setStatus(1);
            order.setCost(0);
            orderService.addOrder(order);
        }
        order.setCost(order.getCost() + chandelier.getUnitCost() * quantity);
        orderService.editOrder(order);
        OrderItem orderItem = new OrderItem();
        Boolean ifFind = false;
        List<OrderItem> orderList1 = new ArrayList<>(order.getOrderItems());
        for (OrderItem item : orderList1) {
            if (item.getChandelier().getArticle().equals(chandelier.getArticle())) {
                item.setQuantity(item.getQuantity() + quantity);
                orderItem = item;
                orderItemService.editOrderItem(item);
                ifFind = true;
            }
        }
        if (!ifFind) {
            orderItem.setOrder(order);
            orderItem.setChandelier(chandelier);
            orderItem.setQuantity(quantity);
            orderItemService.addOrderItem(orderItem);
        }


        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/details");
        Chandelier chan = chandelierService.getChandelierByArticle(article);
        modelAndView.addObject("article", chan.getArticle());
        modelAndView.addObject("unitcost", chan.getUnitCost());
        modelAndView.addObject("height", chan.getHeight());
        modelAndView.addObject("width", chan.getWidth());
        modelAndView.addObject("power", chan.getPower());
        modelAndView.addObject("lamps", chan.getNumber_lamp());
        modelAndView.addObject("category",chan.getCategory().getName());
        modelAndView.addObject("firm",  chan.getFirm().getName());
        modelAndView.addObject("info", chan.getInfo());
        modelAndView.addObject("style",chandelier.getStyle().getName());
        modelAndView.addObject("cartridge",chandelier.getCartridge().getName());
        modelAndView.addObject("bodycolor",chandelier.getBodycolor().getName());
        modelAndView.addObject("bodymaterial",chandelier.getBodymaterial().getName());
        modelAndView.addObject("plafoncolor",chandelier.getPlafoncolor().getName());
        modelAndView.addObject("plafonmaterial",chandelier.getPlafonmaterial().getName());

        List<OrderItem> orderItemList = new ArrayList<>(order.getOrderItems());
        modelAndView.addObject("orderItem", orderItemList);
        modelAndView.addObject("cost", order.getCost());
        modelAndView.addObject("modal", "$('.modal').modal('show');");
        modelAndView.addObject("image", imageService.generateImageUrl(chandelier));
        modelAndView.addObject("imageService", imageService);
        return modelAndView;
    }

    @RequestMapping(value = "/checkout")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ModelAndView checkout() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/checkout");
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.getByEmail(email);
        modelAndView.addObject("name", user.getName());
        modelAndView.addObject("number", user.getNumber());
        modelAndView = CartController.getCart(modelAndView,userService);
        modelAndView.addObject("imageService",imageService);
        return modelAndView;
    }

    @RequestMapping(value = "/order/success")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ModelAndView order(@RequestParam(value = "name") String name, @RequestParam(value = "info") String info,
                              @RequestParam(value = "number") String number, @RequestParam(value = "city") String city,
                              @RequestParam(value = "address") String address) {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.getByEmail(email);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("orderSuccess");
        List<Order> orderList = new ArrayList<>(user.getOrders());
        Order order = new Order();
        for (Order myorder : orderList) {
            if (myorder.getStatus() == 1) {
                order = myorder;
                break;
            }
        }
        user.setName(name);
        user.setNumber(number);
        order.setAddress(city + ", " + address);
        order.setInfo(info);
        Date date = new Date();
        order.setDate(date);
        order.setStatus(2);
        List<OrderItem> orderItemList = new ArrayList<>(order.getOrderItems());
        modelAndView.addObject("orderId", order.getOrderId());
        modelAndView.addObject("cost", order.getCost());
        modelAndView.addObject("number", number);
        modelAndView.addObject("address", city + ", " + address);
        modelAndView.addObject("orderItem", orderItemList);
        modelAndView.addObject("imageService", imageService);
        orderService.editOrder(order);
        userService.editUser(user);
        return modelAndView;
    }

    @RequestMapping(value = "/remove/{article}")
    @PreAuthorize("hasRole('ROLE_USER')")
    public String buy(@PathVariable("article") Integer article) {
        OrderItem orderItem = orderItemService.getOrderItemByID(article);
        orderItemService.deleteOrderItem(orderItem);
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.getByEmail(email);
        List<Order> orderList = new ArrayList<>(user.getOrders());
        Order order = null;
        for (int i = 0; i < orderList.size(); i++) {
            if (orderList.get(i).getStatus() == 1) {
                order = orderList.get(i);
                break;
            }
        }
        order.setCost(order.getCost() - orderItem.getChandelier().getUnitCost() * orderItem.getQuantity());
        orderService.editOrder(order);
        return "redirect:/";
    }

    @RequestMapping(value = "/orders/current")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView orderscurrent() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Admin/ordersCurrent");
        List<Order> orderList = orderService.loadOrderList();
        ArrayList<Order> orderArrayList = new ArrayList<>();
        for (Order order : orderList) {
            if (order.getStatus() == 2)
                orderArrayList.add(order);
        }
        modelAndView.addObject("orderList", orderArrayList);
        return modelAndView;
    }

    @RequestMapping(value = "/orders/all")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView ordersall() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Admin/ordersAll");
        List<Order> orderList = orderService.loadOrderList();
        modelAndView.addObject("orderList", orderList);
        return modelAndView;
    }

    @RequestMapping(value = "/order/detail/{orderid}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView orderDetail(@PathVariable("orderid") Integer orderid) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Admin/orderDetail");
        Order order = orderService.getOrderByID(orderid);
        modelAndView.addObject("imageService", imageService);
        modelAndView.addObject("order", order);
        return modelAndView;
    }

    @RequestMapping(value = "/order/finish/{orderid}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String orderFinish(@PathVariable("orderid") Integer orderid) {
        Order order = orderService.getOrderByID(orderid);
        order.setStatus(3);
        orderService.editOrder(order);
        return "redirect: /admin";
    }

    @RequestMapping(value = "/order/cancel/{orderid}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String orderCansel(@PathVariable("orderid") Integer orderid) {
        Order order = orderService.getOrderByID(orderid);
        order.setStatus(4);
        orderService.editOrder(order);
        return "redirect: /admin";
    }
}
