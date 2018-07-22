package com.travel.sso.controller;

import com.travel.common.pojo.User;
import com.travel.common.utils.JsonUtil;
import com.travel.sso.service.UserService;
import com.travel.sso.utils.CookieUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("login.html")
    @ResponseBody
    public String login(String email, String password, String callback, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String,Object> map=new HashMap<>();
        String s = userService.doLogin(email, password);
        if (s==null){
            map.put("status",false);
            return callback+"("+JsonUtil.getJSON(s)+")";

        }
        CookieUtils.setCookie(request,response,"TOKEN_KEY",s);
        map.put("status",true);
        return callback+"("+JsonUtil.getJSON(s)+")";
    }
    @RequestMapping("info.html")
    @ResponseBody
    public String check(String callback, HttpServletRequest request) throws Exception {
        //从cookie中获取票据
        String token = CookieUtils.getCookieValue(request, "TOKEN_KEY");
        //查询用户信息
        User user = userService.getUserInfo(token);
        Map<String, Object> result = new HashMap<>();
        if (user == null) {
            result.put("status", false);
        } else {
            result.put("data", user);
            result.put("status", true);
        }
        return callback + "(" + JsonUtil.getJSON(result) + ")";
    }

}
