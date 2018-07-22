package com.travel.common.pojo;

import java.io.Serializable;
import java.util.Date;

public class IndexAdv implements Serializable {
    private Integer id;
    private Integer type;//类型，1一级广告位，2二级广告位
    private Hotel hotel;//广告位商品
    private Date createdDate;//创建时间
    private Date startDate;//开始展示的时间
    private Date endDate;//从广告位下架的时间
    private Integer status;//状态，1上架，0未上架，-1过期
    private Date updateTime;//修改时间
    private Integer sort;//排序，sort越小越靠前

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
}
