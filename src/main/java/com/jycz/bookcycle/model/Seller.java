package com.jycz.bookcycle.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class Seller {
    private String sellerId;
    private String realName;
    private String sellerPhone;
    private String idCardNo;
    private String address;
    private int bookNum;
    private String bookInfo;
    private String bookUrl;
}
