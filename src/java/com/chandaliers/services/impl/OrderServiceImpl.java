package com.chandaliers.services.impl;

import com.chandaliers.dao.OrderDao;
import com.chandaliers.models.Order;
import com.chandaliers.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public void addOrder(Order order) {
        orderDao.saveAndFlush(order);
    }

    @Override
    public void deleteOrder(Order order) {
        orderDao.delete(order);
    }

    @Override
    public void editOrder(Order order) {
        orderDao.saveAndFlush(order);
    }

    @Override
    public Order getOrderByID(int id) {
        return orderDao.findOne(id);
    }

    @Override
    public List<Order> loadOrderList() {
        return orderDao.findAll();
    }
}