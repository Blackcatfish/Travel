package com.travel.index.service.listener;

import com.travel.index.service.HotelIndexService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

public class HotelIndexListener implements MessageListener {
    @Autowired
    private HotelIndexService hotelIndexService;
    @Override
    public void onMessage(Message message) {

        Integer hotelId=null;
        try {
            if (message instanceof TextMessage){
                TextMessage textMessage=  (TextMessage) message;
                hotelId =Integer.parseInt(textMessage.getText());
            }
            hotelIndexService.doUpdateHotelIndex(hotelId);
        } catch (JMSException e) {
            e.printStackTrace();
        }
    }
}
