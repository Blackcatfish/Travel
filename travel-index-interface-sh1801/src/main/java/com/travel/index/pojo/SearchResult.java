package com.travel.index.pojo;

import com.travel.common.pojo.Hotel;

import java.io.Serializable;
import java.util.List;

public class SearchResult implements Serializable {
    private Long count;
    private List<Hotel> list;

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public List<Hotel> getList() {
        return list;
    }

    public void setList(List<Hotel> list) {
        this.list = list;
    }
}
