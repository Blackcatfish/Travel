package com.travel.sso.utils;

import java.io.Serializable;

public class TravelResult implements Serializable {
    // 响应业务状态
    private Boolean status;
    // 响应消息
    private String msg;

    // 响应中的数据
    private Object data;

    public TravelResult() {

    }

    public TravelResult(Boolean status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }
    //getter/setter略
    public static TravelResult getErrorResult(String msg, Object data) {
        return new TravelResult(false, msg, data);
    }

    public static TravelResult getErrorResult(String msg) {
        return new TravelResult(false, msg, null);
    }

    public static TravelResult getOkResult(String msg, Object data) {
        return new TravelResult(true, msg, data);
    }

    public static TravelResult getOkResult(String msg) {
        return new TravelResult(true, msg, null);
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
