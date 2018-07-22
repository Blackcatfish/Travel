package com.travel.search.controller;

import com.github.pagehelper.util.StringUtil;
import com.travel.common.pojo.Hotel;
import com.travel.index.pojo.SearchResult;
import com.travel.index.service.HotelIndexService;
import com.travel.manager.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
    @Autowired
    private HotelService hotelService;
    @Autowired
    private HotelIndexService hotelIndexService;
    @RequestMapping("search.html")
    public ModelAndView search(String keywords, Integer min, Integer max, @RequestParam(defaultValue = "1")int page){
        String queryString="item_keywords:"+keywords;
        if(StringUtil.isEmpty(keywords)){
            queryString="*:*";
        }
        if (!StringUtils.isEmpty(min)||!StringUtils.isEmpty(max)){
            queryString += " AND item_price:[";
            queryString += StringUtils.isEmpty(min) ? "*" : min;
            queryString += " TO ";
            queryString += StringUtils.isEmpty(max) ? "*" : max;
            queryString += "]";
        }
        SearchResult hotelFromIndex = hotelIndexService.getHotelFromIndex(queryString, page, 6, true);
        return new ModelAndView("hotel_list", "hotels", hotelFromIndex);

    }
@RequestMapping("detail.html")
    public ModelAndView detail(Integer id){
    Hotel hotel = hotelService.getHotelById(id);
    return new ModelAndView("hotel_detail","hotel",hotel);
    }
}
