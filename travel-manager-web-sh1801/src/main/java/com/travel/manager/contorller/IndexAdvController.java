package com.travel.manager.contorller;

import com.github.pagehelper.PageInfo;
import com.travel.common.pojo.Hotel;
import com.travel.common.pojo.IndexAdv;
import com.travel.common.utils.Constants;
import com.travel.common.utils.JsonUtil;
import com.travel.index.pojo.SearchResult;
import com.travel.index.service.HotelIndexService;
import com.travel.manager.service.IndexAdvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/static")
public class IndexAdvController {
    @Autowired
    private IndexAdvService indexAdvService;
    @Autowired
    private HotelIndexService hotelIndexService;
    @RequestMapping("/list.html")
    @ResponseBody
    public Map<String,Object> list(IndexAdv indexAdv,Integer page,Integer rows){
        PageInfo<IndexAdv> indexAdvList = indexAdvService.getIndexAdvList(indexAdv, page, rows);
        Map<String,Object> map=new HashMap<>();
        map.put("total",indexAdvList.getTotal());
        map.put("rows",indexAdvList.getList());
        return map;
    }
    @RequestMapping("/search_hotel.html")
    @ResponseBody
    public List<Hotel> getHotelList(@RequestParam(defaultValue = "1") Integer page, String keywords) {
        SearchResult result = hotelIndexService.getHotelFromIndex(keywords, page, 5, true);
        return result.getList();
    }
    @RequestMapping("/go_edit.html")
    public String goEdit(Model model, @RequestParam(required = false) Integer id) {
        if (id != null) {//有id表示修改。查询出数据传到页面上
            IndexAdv adv = indexAdvService.getIndexAdvById(id);
            model.addAttribute("indexAdv", adv);
        }
        return "/index_adv_edit.jsp";
    }
    @RequestMapping("/edit.html")
    @ResponseBody
    public Map<String, Object> edit(IndexAdv indexAdv) {
        if (indexAdv.getId() == null) {
            indexAdvService.addIndexAdv(indexAdv);
        } else {
            indexAdvService.updateIndexAdv(indexAdv);
        }
        return JsonUtil.getOkMsg("编辑成功", null);
    }
    @RequestMapping("/del.html")
    @ResponseBody
    public Map<String, Object> delete(Integer id) {
        if (id != null) {
            IndexAdv adv = indexAdvService.getIndexAdvById(id);
            if (adv.getStatus().equals(Constants.ADV_STATUS_CREATED)) {
                adv.setStatus(Constants.ADV_STATUS_DEL);
                indexAdvService.updateIndexAdv(adv);
            } else {
                return JsonUtil.getErrorMsg("只能删除未上架的广告位");
            }

        }
        return JsonUtil.getOkMsg("下架成功", null);
    }
    @RequestMapping("/export.html")
    @ResponseBody
    public Map<String, Object> detail(Integer id) throws Exception {
        if (indexAdvService.exportDetailPage(id)) {
            return JsonUtil.getOkMsg("导出成功", null);
        } else {
            return JsonUtil.getErrorMsg("导出失败");
        }
    }
}
