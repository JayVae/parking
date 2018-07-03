package com.hu.parking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hu.parking.service.msgPush.Message;
import com.hu.parking.service.msgPush.MessagePushService;
import com.hu.parking.service.msgPush.MessagePushServiceHandler;

@Controller
@RequestMapping(value = "/msgpush")
public class MsgPushController {
	
	@Autowired
	MessagePushService messagePushService;
	
	@Autowired
	MessagePushServiceHandler messagePushServiceHandler;

	@RequestMapping(value = "/run")
	@ResponseBody
	public String testNetty(){
		try {
			messagePushService.run();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ok";
	}
	
	@RequestMapping(value = "/sendMsg")
	@ResponseBody
	public String sendMsg(){
		Message message = new Message();
		message.setMsgname("approval");
		message.setMsgtype("1");
		message.setMsgcontent("你好啊啊啊!!!");
		message.setMsgend("<e>");
		messagePushServiceHandler.sendMsg(message);
		return "ok";
	}
	
}
