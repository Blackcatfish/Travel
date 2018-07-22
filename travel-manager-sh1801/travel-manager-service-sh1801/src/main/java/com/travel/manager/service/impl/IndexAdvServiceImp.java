package com.travel.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.travel.common.pojo.Hotel;
import com.travel.common.pojo.IndexAdv;
import com.travel.manager.dao.HotelDao;
import com.travel.manager.dao.IndexAdvDAO;
import com.travel.manager.service.IndexAdvService;
import com.travel.manager.util.FTPUtil;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class IndexAdvServiceImp implements IndexAdvService {
   @Autowired
   private IndexAdvDAO indexAdvDAO;
   @Autowired
   private HotelDao hotelDao;
    @Override
    public void addIndexAdv(IndexAdv indexAdv) {
        indexAdvDAO.addIndexAdv(indexAdv);
    }

    @Override
    public void updateIndexAdv(IndexAdv indexAdv) {
indexAdvDAO.updateIndexAdv(indexAdv);
    }

    @Override
    public PageInfo<IndexAdv> getIndexAdvList(IndexAdv adv, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<IndexAdv> indexAdvList = indexAdvDAO.getIndexAdvList(adv);

        return new PageInfo<>(indexAdvList);
    }

    @Override
    public IndexAdv getIndexAdvById(Integer id) {
        return indexAdvDAO.getIndexAdvById(id);
    }

    @Override
    public List<IndexAdv> getIndexAdvForUpdate(IndexAdv adv) {
        return indexAdvDAO.getIndexAdvList(adv);
    }

    @Override
    public void updateIndexAdvStatus(IndexAdv adv) {
indexAdvDAO.updateIndexStatus(adv);
    }
@Autowired
private FreeMarkerConfigurer freeMarkerConfigurer;
    @Value("${FTP_SERVER}")
    private  String FTP_SERVER;
    @Value("${FTP_PATH}")
    private String FTP_PATH;
    @Value("${FTP_USER}")
    private String FTP_USER;
    @Value("${FTP_PASSWORD}")
    private String FTP_PASSWORD;
    @Value("${TEMP_FILE_DIR}")
    private String TEMP_FILE_DIR;
    @Override
    public boolean exportDetailPage(Integer id) {
        Hotel hotel = hotelDao.getHotel(id);
        Configuration configuration = freeMarkerConfigurer.getConfiguration();
        try {
            Template template = configuration.getTemplate("hotel-detail.ftl");
            Map dataModel=new HashMap<>();
            dataModel.put("hotel",hotel);
            File file = new File(TEMP_FILE_DIR + "hotel-detail-" + id + ".html");
            Writer writer=new FileWriter(file);
            template.process(dataModel,writer);
            writer.close();
            FileInputStream in = new FileInputStream(file);
            FTPUtil.uploadFile(FTP_SERVER, 21, FTP_USER,
                    FTP_PASSWORD, FTP_PATH, "hotel-detail-" + id + ".html", in);
            in.close();
            file.delete();
            return  true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
}
