package com.travel.manager.dao;
import com.travel.common.pojo.City;

import java.util.List;

public interface CityDao {
    void addCity(City city);
    void updateCity(City city);
    List<City> getCityList(City city);
    void deleteCity(Integer id);
    City selectOne(Integer id);
}
