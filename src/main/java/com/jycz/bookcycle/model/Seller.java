package com.jycz.bookcycle.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Seller extends User {
    private String sellerId;
    private String realName;
    private String sellerPhone;
    private String idCardNo;
    private String Address;
}
