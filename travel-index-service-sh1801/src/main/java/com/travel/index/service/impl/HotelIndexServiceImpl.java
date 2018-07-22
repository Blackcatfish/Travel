package com.travel.index.service.impl;

import com.travel.common.pojo.Hotel;
import com.travel.common.utils.Constants;
import com.travel.index.pojo.SearchResult;
import com.travel.index.service.HotelIndexService;
import com.travel.manager.dao.HotelDao;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class HotelIndexServiceImpl implements HotelIndexService {
    @Autowired
    private HotelDao hotelDao;
    @Resource
    private SolrClient solrClient;

    @Override
    public boolean doUpdateHotelIndex(Integer hotelId) {

            try {
                if (hotelId == null) {
                    throw new Exception("酒店id不能为空！");
                }
                Hotel hotel = hotelDao.getHotel(hotelId);
                if (hotel==null){
                    throw new Exception("酒店不存在或者酒店已经下架！");
                }
                if (hotel.getStatus()==Constants.HOIEL_STATUS_INVALID){
                    solrClient.deleteById(hotelId.toString());
                }else {
                    SolrInputDocument doc = new SolrInputDocument();
                    //这个field是在solr core 中配置的
                    doc.addField("id",hotel.getId());
                    doc.addField("item_title",hotel.getTitle());
                    doc.addField("item_content",hotel.getContent());
                    doc.addField("item_city_id", hotel.getCityId());
                    doc.addField("item_city_name", hotel.getCityName());
                    doc.addField("item_image", hotel.getImage());
                    doc.addField("item_price", hotel.getPrice());
                    solrClient.add(doc);
                }
                solrClient.commit();
            }
            catch (Exception e) {
                e.printStackTrace();
                return false;
            }

        return true;
    }

    @Override
    public SearchResult getHotelFromIndex(String queryString, int page, int rows, boolean hightlight) {
        SolrQuery query=new SolrQuery(queryString);//定义查询内容;
        query.setStart((page-1)*rows);//定义起始页
        query.setRows(rows);//每页显示的数量
        query.setSort("id",SolrQuery.ORDER.asc);//排序
        query.setHighlight(hightlight);
        if (hightlight){
            query.addHighlightField("item_title");
            query.setHighlightSimplePre("<font color='red'>");
            query.setHighlightSimplePost("</font>");
        }
        try {
            QueryResponse resp=solrClient.query(query);
            SolrDocumentList results = resp.getResults();
            List<Hotel> hotelList=new ArrayList<>();
            for (SolrDocument result : results) {
                Hotel hotel = new Hotel();
                hotel.setId(Integer.valueOf(result.get("id").toString()));
                hotel.setTitle((String) result.get("item_title"));
                hotel.setPrice(Integer.valueOf(result.get("item_price").toString()));
                hotel.setCityName((String) result.get("item_city_name"));
                hotel.setImage((String) result.get("item_image"));
                if(hightlight){
                    Map<String,Map<String,List<String>>> highlighting=resp.getHighlighting();
                    List<String> list =highlighting.get(result.get("id")).get("item_title");
                    String itemTitle="";
                    if(list!=null&&list.size()>0){
                        itemTitle=list.get(0);
                    }else {
                        itemTitle= (String) result.get("item_title");
                    }
                    hotel.setTitle(itemTitle);
                }
                hotelList.add(hotel);
            }
            SearchResult result=new SearchResult();
            result.setList(hotelList);
            result.setCount(results.getNumFound());
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
