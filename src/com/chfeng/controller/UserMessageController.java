package com.chfeng.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chfeng.po.User;
import com.chfeng.po.UserMessage;
import com.chfeng.service.UserMessageService;

@Controller
@RequestMapping("/UserMessage")
public class UserMessageController {
	@Autowired
	private UserMessageService userMessageService;
	
	/**
	 * 查询新通知
	 */
	@RequestMapping(value = "/receiveMessage.action", method = RequestMethod.GET)
	@ResponseBody
	public String receiveMessage(HttpSession session) {
		User user = (User)session.getAttribute("currentUser");
		UserMessage newMessage =  userMessageService.receiveMessage(user.getAccount()); //查询是否有新通知！
		if(newMessage != null) {
			userMessageService.updateReadStatus(user.getAccount()); //标记已读！
			return "PASS";
//		}else if(newMessage != null && newMessage.getRead_status() == "2"){
//			userMessageService.updateReadStatus(user.getAccount()); //标记已读！
//			return "DELETE";
		}else {
			return "FALL";
		}
	}
	
//	/**
//	 * 插入新通知
//	 */
//	@RequestMapping(value = "/", method = RequestMethod.POST)
//	public int addUserMessage(String pic_id,HttpSession session) {
//		User user = (User)session.getAttribute("currentUser");
//		int resultaddUserMessage = userMessageService.addUserMessage(user.getAccount(), pic_id);
//		if(resultaddUserMessage != null) {
//			return "OK";
//		}else {
//			return "FALL";
//		}
//		
//	}
}
