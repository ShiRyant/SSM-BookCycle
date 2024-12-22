package com.jycz.bookcycle.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

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
    private List<Comment> comments;
}