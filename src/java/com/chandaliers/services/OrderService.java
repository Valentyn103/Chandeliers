package com.chandaliers.services;

import com.chandaliers.models.Order;

import java.util.List;

public interface OrderService {


    public void addOrder(Order order);

    public void deleteOrder(Order order);

    public void editOrder(Order order);

    public Order getOrderByID(int id);

    public List<Order> loadOrderList();
}
