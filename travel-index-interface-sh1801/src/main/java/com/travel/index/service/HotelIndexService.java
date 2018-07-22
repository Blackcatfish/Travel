package com.travel.index.service;

import com.travel.index.pojo.SearchResult;

public interface HotelIndexService {
    boolean doUpdateHotelIndex(Integer hotelId);
    SearchResult getHotelFromIndex(String queryString,int page,int rows,boolean hightlight);
}
