package com.travel.manager.service;

import com.github.pagehelper.PageInfo;
import com.travel.common.pojo.IndexAdv;

import java.util.List;

public interface IndexAdvService {
    //添加广告位
    void addIndexAdv(IndexAdv indexAdv);

    //修改广告位
    void updateIndexAdv(IndexAdv indexAdv);

    //查询广告位分页列表
    PageInfo<IndexAdv> getIndexAdvList(IndexAdv adv, int pageNum, int pageSize);

    //根据主键查询
    IndexAdv getIndexAdvById(Integer id);

    //查询要更新的列表(用于定时任务)
    List<IndexAdv> getIndexAdvForUpdate(IndexAdv adv);

    //修改广告位状态
    void updateIndexAdvStatus(IndexAdv adv);
    boolean exportDetailPage(Integer id);
}
