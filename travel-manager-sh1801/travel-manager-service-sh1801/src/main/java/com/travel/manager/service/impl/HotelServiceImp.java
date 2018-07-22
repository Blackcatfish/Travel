package com.travel.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.travel.common.pojo.Hotel;
import com.travel.manager.dao.HotelDao;
import com.travel.manager.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.jms.*;
import java.util.List;
@Service
public class HotelServiceImp implements HotelService {
    @Autowired
    private HotelDao hotelDao;
    @Autowired
    private JmsTemplate jmsTemplate;
    @Resource
    private Destination destination;

    public boolean doUpdateIndex(Integer hotelId) {
            try {
            jmsTemplate.send(destination, new MessageCreator() {
                @Override
                public Message createMessage(Session session) throws JMSException {
                    TextMessage textMessage = session.createTextMessage(hotelId.toString());
                    return textMessage;
                }
            });
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public void addHotel(Hotel hotel) {
        hotelDao.addHotel(hotel);
        doUpdateIndex(hotel.getId());
    }

    @Override
    public void updateHotel(Hotel hotel) {
        hotelDao.updateHotel(hotel);
        doUpdateIndex(hotel.getId());
    }

    @Override
    public PageInfo<Hotel> getHotelList(Hotel hotel, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Hotel> hotels = hotelDao.getHotelList(hotel);
        return new PageInfo<>(hotels);
    }

    @Override
    public Hotel getHotelById(Integer id) {
        return hotelDao.getHotel(id);
    }

    @Override
    public void deleteHotel(Integer id) {
    hotelDao.deleteHotel(id);

    }
}
