package com.travel.manager.dao;

import com.travel.common.pojo.IndexAdv;

import java.util.List;

public interface IndexAdvDAO {
    //新增广告位
    void addIndexAdv(IndexAdv indexAdv);
    //修改广告位
    void updateIndexAdv(IndexAdv indexAdv);
    //修改广告位的状态
    void updateIndexStatus(IndexAdv indexAdv);
    //查询广告位的列表
    List<IndexAdv> getIndexAdvList(IndexAdv indexAdv);
    //根据id查询广告位
    IndexAdv getIndexAdvById(Integer id);
}
