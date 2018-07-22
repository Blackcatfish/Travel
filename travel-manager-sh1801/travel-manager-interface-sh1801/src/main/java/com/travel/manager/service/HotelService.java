package com.travel.manager.service;

import com.github.pagehelper.PageInfo;
import com.travel.common.pojo.Hotel;

public interface HotelService {
    //添加酒店
    void addHotel(Hotel hotel);

    //修改酒店
    void updateHotel(Hotel hotel);

    //根据条件查询酒店(带分页)
    PageInfo<Hotel> getHotelList(Hotel hotel, Integer pageNum, Integer pageSize);

    //根据主键查询
    Hotel getHotelById(Integer id);
    void deleteHotel(Integer id);
}
