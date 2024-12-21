package com.jycz.bookcycle.mapper;

import com.jycz.bookcycle.model.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    boolean save(User user);
    boolean update(User user);
    boolean delete(String userId);
    User findById(String userId);
    User findByUsername(String username);
    //int updateUserToSeller(String userId);
}
