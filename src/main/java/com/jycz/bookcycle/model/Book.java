package com.jycz.bookcycle.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class Book {
    private int bookId;
    private String title;
    private String author;
    private String publisher;
    private String isbn;
    private String category;
    private BigDecimal price;
    private String description;
    private String image;
}