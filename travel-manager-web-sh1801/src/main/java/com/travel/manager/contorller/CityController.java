package com.travel.manager.contorller;

import com.github.pagehelper.PageInfo;
import com.travel.common.pojo.City;
import com.travel.common.utils.JsonUtil;
import com.travel.manager.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/city")
public class CityController {
    @Autowired
    private CityService cityService;
    @RequestMapping("/list.html")
    @ResponseBody
    public Map<String,Object> list(City city,Integer page,Integer rows){
       PageInfo<City> pageInfo = cityService.getCityList(city, page, rows);
        Map<String,Object> map = new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }
    @RequestMapping("/edit.html")
    @ResponseBody
    public Map<String, Object> addCity(City city) {
        if (city.getId() == null) {//如果没有id代表新增
            cityService.addCity(city);
        } else {
            cityService.updateCity(city);
        }
        return JsonUtil.getOkMsg("编辑成功", null);
    }
    @RequestMapping("/delete.html")
    @ResponseBody
    public Map<String,Object> delete(Integer id){
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("success", true);
            result.put("message", "删除成功");
            cityService.deleteCity(id);
        } catch (Exception e) {
            result.put("sucess", false);
            result.put("message", e.getMessage());
        }
        return result;
    }
   /* @RequestMapping("/download.html")
    public void dowload(HttpServletResponse response) throws IOException {
        List<City> cities = cityService.selectAll();
       *//* File excel=PoiExc*//*
        response.setContentType("application/excel;charset=utf=-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + excel.getName());
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", -1);
        ServletOutputStream servletOutputStream = response.getOutputStream();
        FileInputStream fileInputStream = new FileInputStream(excel);
        BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
        int size = 0;
        byte[] b = new byte[4096];
        while ((size = bufferedInputStream.read(b)) != -1) {
            servletOutputStream.write(b, 0, size);
        }
        servletOutputStream.flush();
        servletOutputStream.close();
        bufferedInputStream.close();

    }*/
}

