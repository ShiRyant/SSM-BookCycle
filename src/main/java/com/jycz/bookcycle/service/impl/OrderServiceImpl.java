package com.jycz.bookcycle.service.impl;

import com.jycz.bookcycle.mapper.OrderMapper;
import com.jycz.bookcycle.model.Order;
import com.jycz.bookcycle.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public boolean saveOrder(Order order) {
        boolean result = false;
        if(order == null)
            return false;
        result = orderMapper.save(order);
        return result;
    }

    @Override
    public boolean deleteOrder(String orderId) {
        boolean result = false;
        Order order = orderMapper.findById(orderId);
        if(order == null)
            return false;
        result = orderMapper.delete(order);
        return result;
    }

    @Override
    public Order getOrder(String orderId) {
        return orderMapper.findById(orderId);
    }
}
