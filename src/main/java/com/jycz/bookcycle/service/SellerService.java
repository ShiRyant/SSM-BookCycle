package com.jycz.bookcycle.service;

import com.jycz.bookcycle.model.Seller;

public interface SellerService {
    boolean saveSeller(Seller seller);
    Seller getSellerByUserId(String userId);
    boolean updateSeller(Seller seller);
    boolean deleteSeller(String userId);
}
