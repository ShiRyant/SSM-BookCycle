package com.jycz.bookcycle.model;

import lombok.Data;

import java.util.Date;

@Data
public class Comment {
    private int commentId;
    private int bookId;
    private String userId;
    private String username;
    private String content;
    private Date commentTime;
}
