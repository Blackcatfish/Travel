package com.travel.manager.dao;

import com.travel.common.pojo.Hotel;

import java.util.List;

public interface HotelDao {
    void addHotel(Hotel hotel);
    void updateHotel(Hotel hotel);
    List<Hotel> getHotelList(Hotel hotel);
    Hotel getHotel(Integer id);
    void deleteHotel(Integer id);
}
