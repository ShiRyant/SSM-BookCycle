package com.jycz.bookcycle.mapper;

import com.jycz.bookcycle.model.Seller;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellerMapper {
    boolean save(Seller seller);
    boolean update(Seller seller);
    boolean delete(String sellerId);
    Seller getSellerById(String sellerId);
}
