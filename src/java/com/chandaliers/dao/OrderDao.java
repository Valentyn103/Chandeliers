package com.chandaliers.dao;

import com.chandaliers.models.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderDao  extends JpaRepository<Order, Integer> {
}
