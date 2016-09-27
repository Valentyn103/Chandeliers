package com.chandaliers.services;

import com.chandaliers.models.OrderItem;

import java.util.List;

public interface OrderItemService {


    public void addOrderItem(OrderItem orderItem);

    public void deleteOrderItem(OrderItem orderItem);

    public void editOrderItem(OrderItem orderItem);

    public OrderItem getOrderItemByID(int id);

    public List<OrderItem> loadOrderItemList();
}
