package com.jycz.bookcycle.service.impl;

import com.jycz.bookcycle.mapper.SellerMapper;
import com.jycz.bookcycle.model.Seller;
import com.jycz.bookcycle.model.User;
import com.jycz.bookcycle.service.SellerService;
import com.jycz.bookcycle.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellerServiceImpl implements SellerService {
    @Autowired
    private SellerMapper sellerMapper;

    @Autowired
    private UserService userService;

    @Override
    public boolean saveSeller(Seller seller) {
        boolean result;
        if(seller == null)
            return false;
        result = sellerMapper.save(seller);
        return result;
    }

    @Override
    public Seller getSellerByUserId(String userId) {
        return sellerMapper.getSellerById(userId);
    }

    @Override
    public boolean updateSeller(Seller seller) {
        return sellerMapper.update(seller);
    }

    @Override
    public boolean deleteSeller(String userId) {
        boolean result;
        Seller seller = sellerMapper.getSellerById(userId);
        if(seller == null)
            return false;
        result = sellerMapper.delete(userId);
        return result;
    }

}
