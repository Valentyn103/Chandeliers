package com.chandaliers.controllers;

import com.chandaliers.models.Order;
import com.chandaliers.models.OrderItem;
import com.chandaliers.models.User;
import com.chandaliers.services.UserService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

public class CartController {

    public static ModelAndView getCart(ModelAndView modelAndView, UserService userService){
        if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser")) {
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
            if (order == null || order.getOrderItems().size() == 0) {
                modelAndView.addObject("auth", "<h3 style=\"margin-top:0px; margin-botton: 0px;\">У вас нет товаров в корзине.</h3>");
                return modelAndView;
            }
            List<OrderItem> orderItemList = new ArrayList<>(order.getOrderItems());
            modelAndView.addObject("orderItem", orderItemList);
            modelAndView.addObject("cost", order.getCost());
        } else
            modelAndView.addObject("auth", "<h3 style=\"margin-top:0px; margin-botton: 0px;\">Пожалуйста, войдите в личный кабинет</h3>");
        return modelAndView;
    }
}
