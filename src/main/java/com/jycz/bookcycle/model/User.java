package com.jycz.bookcycle.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class User {
    private String userId;
    private String username;
    private String password;
    private String salt;
    private String phoneNumber;
    private String email;
    private Date registerTime;
}