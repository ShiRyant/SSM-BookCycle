package com.jycz.bookcycle.mapper;

import com.jycz.bookcycle.model.Order;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {
    boolean save(Order order);
    boolean delete(Order order);
    Order findById(String orderId);
}
