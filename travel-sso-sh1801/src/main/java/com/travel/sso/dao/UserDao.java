package com.travel.sso.dao;

import com.travel.common.pojo.User;

public interface UserDao {
    void addUser(User user);

    User getUserEmail(String email);
}
