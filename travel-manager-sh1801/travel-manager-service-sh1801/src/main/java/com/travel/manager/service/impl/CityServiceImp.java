package com.travel.manager.service.impl;



import com.fasterxml.jackson.core.type.TypeReference;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.travel.common.pojo.City;
import com.travel.common.utils.JedisClient;
import com.travel.common.utils.JsonUtil;
import com.travel.manager.dao.CityDao;
import com.travel.manager.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


import java.io.IOException;
import java.util.List;
@Service
public class CityServiceImp implements CityService {
    @Autowired
    private CityDao cityDao;
    @Autowired
    private JedisClient jedisClient;
    @Override
    public void addCity(City city) {
    cityDao.addCity(city);
        jedisClient.expire(CITY_LIST,0);
    }

    @Override
    public void updateCity(City city) {
cityDao.updateCity(city);
jedisClient.expire(CITY_LIST,0);
    }

    @Override
    public PageInfo<City> getCityList(City city, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<City> cityList = cityDao.getCityList(city);
        return new PageInfo<>(cityList);
    }

    @Override
    public void deleteCity(Integer id) {
cityDao.deleteCity(id);
        jedisClient.expire(CITY_LIST,0);
    }

    @Override
    public City selectOne(Integer id) {
        return cityDao.selectOne(id);
    }
@Value("${CITY_LIST}")
private String CITY_LIST;
    @Override
    public List<City> selectAll() {
        //从redis读取
        String json=jedisClient.get(CITY_LIST);
          if (json!=null){
              try {
                  //如果有就返回
                  return JsonUtil.getObj(json, new TypeReference<List<City>>() {
                  });
              } catch (IOException e) {
                  e.printStackTrace();
              }
          }
          //没有从数据库中查找
        List<City> cityList = cityDao.getCityList(null);
        try {
            //将查到的数据再放入Redis
            jedisClient.set(CITY_LIST,JsonUtil.getJSON(cityList));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return cityList;
    }
}
