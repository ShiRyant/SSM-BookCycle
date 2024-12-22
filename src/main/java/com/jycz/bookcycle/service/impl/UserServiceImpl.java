package com.jycz.bookcycle.service.impl;

import com.jycz.bookcycle.model.User;
import com.jycz.bookcycle.service.SellerService;
import com.jycz.bookcycle.service.UserService;
import com.jycz.bookcycle.mapper.UserMapper;
import com.jycz.bookcycle.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private SellerService sellerService;

    @Override
    public boolean saveUser(User user) {
        boolean result;
        if(user == null)
            return false;
        result = userMapper.save(user);
        return result;
    }

    @Override
    public boolean updateUser(User user) {
        return userMapper.update(user);
    }

    @Override
    public boolean deleteUser(String userId) {
        boolean result;
        User user = userMapper.findById(userId);
        if(user == null)
            return false;
        result = userMapper.delete(userId);
        return result;
    }

    @Override
    public User getUser(String userId) {
        return userMapper.findById(userId);
    }

    @Override
    public User login(User user) {
        User loginUser = userMapper.findByUsername(user.getUsername());

        if(loginUser == null)
            return null;
        String password = UserUtil.md5Password(user.getPassword(),loginUser.getSalt(),10);
        if(!password.equals(loginUser.getPassword()))
            return null;
        return loginUser;
    }

    @Override
    public String register(User user) {
        User registerUser = new User();
        try {
            if (user == null)
                return "failed";
            else {
                String uid = UserUtil.getRandomNumber(10);
                String salt = UserUtil.getRandomNumber(16);

                registerUser.setUserId(uid);
                registerUser.setUsername(user.getUsername());
                registerUser.setPassword(UserUtil.md5Password(user.getPassword(),salt,10));
                registerUser.setSalt(salt);
                registerUser.setPhoneNumber(user.getPhoneNumber());
                registerUser.setEmail(user.getEmail());
                registerUser.setRegisterTime(new Date());

                userMapper.save(registerUser);
                return "success";
            }
        } catch (Exception e) {
            System.out.println("注册失败，请重试！");
            System.out.println(e);
            return "failed";
        }
    }

//    @Override
//    public boolean applyForSeller(String userId, Seller sellerInfo) {
//        int rows = userMapper.updateUserToSeller(userId);
//        if(rows > 0){
//            return sellerService.updateSeller(sellerInfo);
//        }
//        return false;
//    }
}