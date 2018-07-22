package com.travel.sso.service;

import com.travel.common.pojo.User;

public interface UserService {
    //登录
    String doLogin(String email, String password);
    //获取用户信息
    User getUserInfo(String token);
}
