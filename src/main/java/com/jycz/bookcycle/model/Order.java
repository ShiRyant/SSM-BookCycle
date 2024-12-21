package com.jycz.bookcycle.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class Order {
    private String orderId;
    private String buyerId;
    private String sellerId;
    private String bookId;
    private BigDecimal totalPrice;
    private int status;
    private Date createTime;
}
