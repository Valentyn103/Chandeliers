package com.chandaliers.dao;

import com.chandaliers.models.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemDao  extends JpaRepository<OrderItem, Integer> {
}
