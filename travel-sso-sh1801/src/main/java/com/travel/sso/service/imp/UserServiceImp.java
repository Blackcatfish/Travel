package com.travel.sso.service.imp;

import com.travel.common.pojo.User;
import com.travel.common.utils.JedisClient;
import com.travel.common.utils.JsonUtil;
import com.travel.sso.dao.UserDao;
import com.travel.sso.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
@Service
public class UserServiceImp implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private JedisClient jedisClient;
    @Override
    public String doLogin(String email, String password) {
        User user= userDao.getUserEmail(email);
        if (user==null||!user.getPassword().equals(password)){
            return null;
        }

        try {
            String token=System.currentTimeMillis()+"_"+user.getId();
            jedisClient.set("USER_SESSION"+token,JsonUtil.getJSON(user));
            return token;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public User getUserInfo(String token) {
        String s = jedisClient.get("USER_SESSION" + token);
        if (s==null){
            return null;
        }
        try {
            User user = (User)JsonUtil.getObj(s, User.class);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
