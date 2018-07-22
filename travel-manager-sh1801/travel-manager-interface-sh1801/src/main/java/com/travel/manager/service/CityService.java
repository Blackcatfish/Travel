package com.travel.manager.service;


import com.github.pagehelper.PageInfo;
import com.travel.common.pojo.City;

import java.util.List;


public interface CityService {
    void addCity(City city);
    void updateCity(City city);
   PageInfo<City> getCityList(City city, int pageNo, int pageSize);
    void deleteCity(Integer id);
    City selectOne(Integer id);
    List<City> selectAll();
}
