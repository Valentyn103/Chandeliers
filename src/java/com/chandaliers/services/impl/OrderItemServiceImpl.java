package com.chandaliers.services.impl;

import com.chandaliers.dao.OrderItemDao;
import com.chandaliers.models.OrderItem;
import com.chandaliers.services.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderItemServiceImpl implements OrderItemService {

    @Autowired
    private OrderItemDao orderItemDao;

    @Override
    public void addOrderItem(OrderItem orderItem) {
        orderItemDao.saveAndFlush(orderItem);
    }

    @Override
    public void deleteOrderItem(OrderItem orderItem) {
        orderItemDao.delete(orderItem);
    }

    @Override
    public void editOrderItem(OrderItem orderItem) {
        orderItemDao.saveAndFlush(orderItem);
    }

    @Override
    public OrderItem getOrderItemByID(int id) {
        return orderItemDao.findOne(id);
    }

    @Override
    public List<OrderItem> loadOrderItemList() {
        return orderItemDao.findAll();
    }
}