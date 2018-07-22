package com.travel.common.utils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

public class JsonUtil {
    /**
     * 将Java对象转化为JSON字符串
     */
    public static String getJSON(Object obj) throws IOException {
        if (null == obj) {
            return "";
        }
        ObjectMapper mapper = new ObjectMapper();
        //转换date类型的时候，时间戳
        mapper.getSerializationConfig().with(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        String jsonStr = mapper.writeValueAsString(obj);
        return jsonStr;
    }

    /**
     * 将JSON字符串转化为Java对象，集合
     */
    public static <T> T getObj(String json, TypeReference<T> ref)
            throws IOException {
        if (null == json || json.length() == 0) {
            return null;
        }
        ObjectMapper mapper = new ObjectMapper();
        mapper.getDeserializationConfig().with(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        return (T) mapper.readValue(json, ref);
    }

    /**
     * 将JSON字符串转化为Java对象，一个对象
     */
    public static Object getObj(String json, Class pojoClass) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(json, pojoClass);
    }

    /**
     * 本工程中页面用ajax请求成功时，统一使用这个方法封装
     * 页面根据statusCode判断请求是否成功
     */
    public static Map<String, Object> getOkMsg(String msg, Object obj) {
        Map<String, Object> res = new HashMap<>();
        res.put("status", true);
        if (null != msg && msg.length() > 0) {
            res.put("msg", msg);
        }
        if (obj != null) {
            res.put("res", obj);
        }
        return res;
    }

    /**
     * 本工程中页面用ajax请求失败时，统一使用这个方法封装
     * 页面根据statusCode判断请求是否成功
     */
    public static Map<String, Object> getErrorMsg(String msg) {
        Map<String, Object> res = new HashMap<>();
        res.put("status", false);
        res.put("message", msg);
        return res;
    }

}
