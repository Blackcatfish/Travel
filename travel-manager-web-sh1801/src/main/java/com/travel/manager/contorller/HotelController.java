package com.travel.manager.contorller;

import com.github.pagehelper.PageInfo;
import com.travel.common.pojo.City;
import com.travel.common.pojo.Hotel;
import com.travel.common.utils.JsonUtil;
import com.travel.index.service.HotelIndexService;
import com.travel.manager.service.CityService;
import com.travel.manager.service.HotelService;
import com.travel.manager.util.FastDFSClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/hotel")
public class HotelController {
    @Autowired
    private CityService cityService;
    @Autowired
    private HotelService hotelService;
    @Autowired
    private HotelIndexService hotelIndexService;
    @RequestMapping("/go_list.html")
    public String cityList(Model model) {
        List<City> cities = cityService.selectAll();
        model.addAttribute("cityList",cities);
        return "/hotel_list.jsp";
    }

    @RequestMapping("/list.html")
    @ResponseBody
    public Map<String,Object> list(Hotel hotel, int page, int rows){
        Map<String,Object> map=new HashMap<>();
        PageInfo<Hotel> hotelList = hotelService.getHotelList(hotel, page, rows);
        map.put("total",hotelList.getTotal());
        map.put("rows",hotelList.getList());
        return map;
    }
@RequestMapping("delete.html")
    @ResponseBody
public Map<String,Object> delete(Integer id){
    Map<String, Object> result = new HashMap<>();
    try {
        result.put("success", true);
        result.put("message", "删除成功");
        hotelService.deleteHotel(id);
    } catch (Exception e) {
        result.put("sucess", false);
        result.put("message", e.getMessage());
    }
    return result;
}
    @RequestMapping("/edit.html")
    @ResponseBody
    public Map<String, Object> addHotel(Hotel hotel) {
        if (hotel.getId() == null) {//如果没有id代表新增
         hotelService.addHotel(hotel);
        } else {
            hotelService.updateHotel(hotel);
        }
        return JsonUtil.getOkMsg("编辑成功", null);
    }
@RequestMapping("/go_edit.html")

    public String goedit(Model model, @RequestParam(required = false)Integer id){
    List<City> cityList = cityService.selectAll();
    model.addAttribute("cityList", cityList);
        if (id!=null){
            Hotel hotel = hotelService.getHotelById(id);
            model.addAttribute("hotel", hotel);
        }
return "/hotel_edit.jsp";
}
    @Value("${IMAGE_SERVER_URL}")
    private String  IMAGE_SERVER_URL;
@RequestMapping("/upload.html")
    @ResponseBody
    public String upload(MultipartFile file) throws Exception {

    try {
        String filename = file.getOriginalFilename();
        String extName=filename.substring(filename.lastIndexOf(".")+1);
        FastDFSClient fastDFSClient = new FastDFSClient("classpath:client.conf");
        String url= fastDFSClient.uploadFile(file.getBytes(), extName);
        url=IMAGE_SERVER_URL+url;
        System.out.println(url);
        Map map=new HashMap<>();
        map.put("error",0);
        map.put("url",url);
        return JsonUtil.getJSON(map);
    } catch (Exception e) {
        e.printStackTrace();
        Map map=new HashMap<>();
        map.put("error",1);
        map.put("message", "图片上传失败");
        return JsonUtil.getJSON(map);
    }

}
@RequestMapping("/solr.html")
@ResponseBody
    public Map<String,Object> updatesolr(Integer hotelId){
    boolean result = hotelIndexService.doUpdateHotelIndex(hotelId);
    if (result){
        return JsonUtil.getOkMsg("更新成功",null);
    }
    return JsonUtil.getErrorMsg("更新失败");
}
}
