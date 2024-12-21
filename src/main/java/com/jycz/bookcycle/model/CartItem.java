package com.jycz.bookcycle.model;

import lombok.Data;
import java.math.BigDecimal;

@Data
public class CartItem {
    private int bookId;
    private String title;
    private BigDecimal price;
    private int quantity;
}
