package com.jycz.bookcycle.service;

import com.jycz.bookcycle.model.Order;

public interface OrderService {
    boolean saveOrder(Order order);
    boolean deleteOrder(String orderId);
    Order getOrder(String orderId);
}
